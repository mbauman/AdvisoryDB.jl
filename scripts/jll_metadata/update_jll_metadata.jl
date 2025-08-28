using TOML: TOML
using HTTP: HTTP
using JSON3: JSON3
using BinaryBuilder: BinaryBuilder
using Pkg: Pkg, Registry

# Copied from AdvisoryDB just to make life a little easier
function get_registry(reg=Registry.RegistrySpec(name="General", uuid = "23338594-aafe-5451-b93e-139f81909106"); depot=Pkg.depots1())
    name = joinpath(depot, "registries", reg.name)
    if !ispath(name) && !ispath(name * ".toml")
        Registry.add([reg]; depot)
    end
    if !ispath(name)
        name = name * ".toml"
    end
    ispath(name) || error("Registry $name not found")
    return Registry.RegistryInstance(name)
end
const GITHUB_API_BASE = "https://api.github.com"
function build_headers()
    headers = [
        "Accept" => "application/vnd.github+json",
        "User-Agent" => "Julia-Advisory-Fetcher/1.0"
    ]
    if haskey(ENV, "GITHUB_TOKEN")
        push!(headers, "Authorization" => "Bearer $(ENV["GITHUB_TOKEN"])")
    end
    return headers
end
function get_releases(owner, repo)
    response = HTTP.get(string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/releases"), build_headers())
    if response.status != 200
        error("Failed to fetch advisories: HTTP $(response.status)")
    end

    return JSON3.read(response.body)
end
function find_commit_date_from_tree_sha(owner, repo, tree_sha)
    url = string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/commits?per_page=100")
    while true
        commits = HTTP.get(url, build_headers())
        for commit in JSON3.read(commits.body)
            info = JSON3.read(HTTP.get(string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/commits/", commit.sha), build_headers()).body)
            if strip(info.commit.tree.sha) == string(tree_sha)
                return info.commit.committer.date
            end
        end
        m = match(r"<([^>]+)>;\s*rel=\"next\"", get(Dict(commits.headers), "Link", ""))
        isnothing(m) && break
        url = m.captures[1]
    end

    error("could not find sha $tree_sha")
end

# Backported from Julia newer release than 1.7
function chopsuffix(s::Union{String, SubString{String}},
                    suffix::Union{String, SubString{String}})
    if !isempty(suffix) && endswith(s, suffix)
        astart = ncodeunits(s) - ncodeunits(suffix) + 1
        @inbounds SubString(s, firstindex(s), prevind(s, astart))
    else
        SubString(s)
    end
end

const yggy = mktempdir()
run(`git clone https://github.com/JuliaPackaging/Yggdrasil.git $yggy`)

jlls(reg = get_registry()) = filter(((k,v),)->endswith(v.name, "_jll"), reg.pkgs)

metadata_for_jll(jll::String; reg = get_registry()) = metadata_for_jll(only(filter(((k,v),)->v.name==jll, reg.pkgs))[2])
function metadata_for_jll(jll::Registry.PkgEntry)
    jllinfo = Registry.registry_info(jll)
    jllrepo = jllinfo.repo
    jllname = chopsuffix(jll.name, "_jll")
    m = match(r"github\.com[:/]([^/]+)/(.*)(?:.git)$", jllinfo.repo)
    isnothing(m) && error("unknown repo $(jllinfo.repo)")
    org, repo = m.captures
    github_releases = get_releases(org, repo)

    metadata = Dict{String,Any}()
    versions_meta = get!(metadata, "versions", Dict{String,Any}())
    for (version, versioninfo) in Registry.registry_info(jll).version_info
        releasetags = filter(r->endswith(r.tag_name, string(version)), github_releases)
        release_published_at = if length(releasetags) == 1
            only(releasetags).published_at
        elseif isempty(releasetags)
            find_commit_date_from_tree_sha(org, repo, versioninfo.git_tree_sha1)
        else
            error("No releases end with a tag of $(string(version)); got $((r->r.tag_name).(github_releases))")
        end
        sources, products = cd(yggy) do
            commit = strip(read(`git rev-list -n 1 --before=$(release_published_at) master`, String))
            run(`git checkout $commit`)
            buildscript = joinpath(yggy, jllname[1:1], jllname, "build_tarballs.jl")
            if !isfile(buildscript)
                name_match_re = string(raw"^\s*name\s*=\s*\"", jllname, raw"\"\s*$")
                buildscript = string(only(filter(endswith("build_tarballs.jl"), split(read(`grep -l -r $name_match_re $yggy`, String)))))
                @info "found $buildscript by name match"
            end
            # Now we can evaluate the buildscript at the time of this release's publication
            # but with `build_tarballs` shadowed to simply log the sources and products:
            m = Module(gensym())
            sources = []
            products = []
            @eval m begin
                include(p) = Base.include($m, p)
                using BinaryBuilder
                # Patch up support for old LibraryProduct syntax
                BinaryBuilder.BinaryBuilderBase.LibraryProduct(prefix::String, name::String, var::Symbol, args...; kwargs...) = LibraryProduct([prefix*name], var, args...; kwargs...)
                function build_tarballs(ARGS, src_name, src_version, sources, script, platforms, products, dependencies; kwargs...)
                    append!($sources, sources)
                    if products isa AbstractVector
                        append!($products, products)
                    else
                        # Old versions of binary builder used a function that could add a prefix:
                        append!($products, products(""))
                    end
                    nothing
                end
                include($buildscript)
            end
            sources, products
        end

        product_names(x::BinaryBuilder.LibraryProduct) = x.libnames
        product_names(x::BinaryBuilder.FrameworkProduct) = x.libraryproduct.libnames
        product_names(x::BinaryBuilder.ExecutableProduct) = x.binnames
        product_names(x::BinaryBuilder.FileProduct) = x.paths
        libs = collect(Iterators.flatten(product_names.(filter(x->isa(x,Union{BinaryBuilder.LibraryProduct,BinaryBuilder.FrameworkProduct}), products))))
        exes = collect(Iterators.flatten(product_names.(filter(x->isa(x,BinaryBuilder.ExecutableProduct), products))))
        files = collect(Iterators.flatten(product_names.(filter(x->isa(x,BinaryBuilder.FileProduct), products))))


        version_meta = get!(versions_meta, string(version), Dict{String,Any}())
        !isempty(libs) && (version_meta["libraries"] = libs)
        !isempty(exes) && (version_meta["executables"] = exes)
        !isempty(files) && (version_meta["files"] = files)
    end

    return metadata
end
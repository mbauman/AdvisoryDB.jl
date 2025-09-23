using TOML: TOML
using HTTP: HTTP
using JSON3: JSON3
using BinaryBuilder: BinaryBuilder, BinaryBuilderBase
using Pkg: Pkg, Registry, PackageSpec
using Base64: base64decode

@eval BinaryBuilderBase begin
    # Disable errors when github archives are used
    check_github_archive(url::String) = nothing
end

# Copied from SecurityAdvisories just to make life a little easier, since this runs v1.7
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
function get_readme(owner, repo, tree_sha)
    response = HTTP.get(string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/git/trees/", tree_sha), build_headers())
    if response.status != 200
        error("Failed to fetch advisories: HTTP $(response.status)")
    end

    tree = JSON3.read(response.body)
    readme = filter(x->x.path == "README.md", tree.tree)
    isempty(readme) && return nothing

    blob = JSON3.read(HTTP.get(readme[].url, build_headers()).body)
    blob.encoding == "base64" || return nothing
    return String(base64decode(blob.content))
end
commit_and_path_from_readme(::Nothing) = nothing, nothing
function commit_and_path_from_readme(readme)
    m = match(r"originating \[`build_tarballs\.jl`\]\(https://github\.com/JuliaPackaging/Yggdrasil/blob/([^/]+)/(.*\.jl)\)", readme)
    isnothing(m) && return nothing, nothing
    return (m.captures[1], joinpath(yggy, m.captures[2]))
end
const COMMIT_INFO = Dict{Tuple{String,String,String},Any}()
function find_commit_date_from_tree_sha(owner, repo, tree_sha)
    url = string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/commits?per_page=100")
    while true
        commits = HTTP.get(url, build_headers())
        for commit in JSON3.read(commits.body)
            info = get!(COMMIT_INFO, (owner,repo,commit.sha)) do
                JSON3.read(HTTP.get(string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/commits/", commit.sha), build_headers()).body)
            end
            if strip(info.commit.tree.sha) == tree_sha
                return info.commit.committer.date
            end
        end
        m = match(r"<([^>]+)>;\s*rel=\"next\"", get(Dict(commits.headers), "Link", ""))
        isnothing(m) && break
        url = m.captures[1]
    end

    error("could not find sha $tree_sha in the commit history of $owner/$repo")
end

function dict(pkg::PackageSpec)
    # effectively Base.show(io::IO, pkg::PackageSpec)
    f = []
    pkg.name !== nothing && push!(f, "name" => string(pkg.name))
    pkg.uuid !== nothing && push!(f, "uuid" => string(pkg.uuid))
    pkg.tree_hash !== nothing && push!(f, "tree_hash" => string(pkg.tree_hash))
    pkg.path !== nothing && push!(f, "path" => string(pkg.path))
    pkg.url !== nothing && push!(f, "url" => string(pkg.url))
    pkg.rev !== nothing && push!(f, "rev" => string(pkg.rev))
    pkg.subdir !== nothing && push!(f, "subdir" => string(pkg.subdir))
    pkg.pinned && push!(f, "pinned" => string(pkg.pinned))
    push!(f, "version" => string(pkg.version))
    if pkg.repo.source !== nothing
        push!(f, "repo/source" => string("\"", pkg.repo.source, "\""))
    end
    if pkg.repo.rev !== nothing
        push!(f, "repo/rev" => string(pkg.repo.rev))
    end
    if pkg.repo.subdir !== nothing
        push!(f, "repo/subdir" => string(pkg.repo.subdir))
    end
    Dict(f)
end

# Backported from Julia (some newer release than 1.7)
function chopsuffix(s::Union{String, SubString{String}},
                    suffix::Union{String, SubString{String}})
    if !isempty(suffix) && endswith(s, suffix)
        astart = ncodeunits(s) - ncodeunits(suffix) + 1
        @inbounds SubString(s, firstindex(s), prevind(s, astart))
    else
        SubString(s)
    end
end
function chopprefix(s::Union{String, SubString{String}},
                    prefix::Union{String, SubString{String}})
    if startswith(s, prefix)
        SubString(s, 1 + ncodeunits(prefix))
    else
        SubString(s)
    end
end

const yggy = mktempdir()
run(pipeline(`git clone https://github.com/JuliaPackaging/Yggdrasil.git $yggy`, stdout=Base.devnull))

jlls(reg = get_registry()) = filter(((k,v),)->endswith(v.name, "_jll"), reg.pkgs)

majorminorpatch(v::VersionNumber) = string(v.major, ".", v.minor, ".", v.patch)
majorminor(v::VersionNumber) = string(v.major, ".", v.minor)
major(v::VersionNumber) = string(v.major)

metadata_for_jll(jll::String; reg = get_registry()) = metadata_for_jll(only(filter(((k,v),)->v.name==jll, reg.pkgs))[2])
function metadata_for_jll(jll::Registry.PkgEntry, versions = Registry.registry_info(jll).version_info)
    jllinfo = Registry.registry_info(jll)
    jllrepo = jllinfo.repo
    jllname = chopsuffix(jll.name, "_jll")
    m = match(r"github\.com[:/]([^/]+)/(.+?)(?:.git)?$", jllinfo.repo)
    isnothing(m) && error("unknown repo $(jllinfo.repo)")
    org, repo = m.captures
    github_releases = get_releases(org, repo)

    metadata = Dict{String,Any}()
    for (version, versioninfo) in versions
        commit_from_readme, path_from_readme = commit_and_path_from_readme(get_readme(org, repo, string(versioninfo.git_tree_sha1)))
        releasetags = filter(r->endswith(r.tag_name, string(version)), github_releases)
        release_published_at = if length(releasetags) == 1
            only(releasetags).published_at
        elseif isempty(releasetags)
            find_commit_date_from_tree_sha(org, repo, string(versioninfo.git_tree_sha1))
        else
            nothing
        end
        commit, buildscript = "", ""
        sources, products, dependencies = cd(yggy) do
            # First look to the
            commit = @something commit_from_readme strip(read(`git rev-list -n 1 --before=$(release_published_at) master`, String))
            run(pipeline(`git checkout $commit`, stdout=Base.devnull, stderr=Base.devnull))
            buildscript = @something path_from_readme joinpath(yggy, uppercase(jllname[1:1]), jllname, "build_tarballs.jl")
            if !isfile(buildscript)
                # First look for a potentially-deeper nested path, without worrying about case, then consider version numbers
                for searchpath in ("./$(jllname[1])/$jllname/build_tarballs.jl",
                                   "*/$jllname/build_tarballs.jl",
                                   "*/$jllname@$version/build_tarballs.jl",
                                   "*/$jllname@$(majorminorpatch(version))/build_tarballs.jl",
                                   "*/$jllname@$(majorminor(version))/build_tarballs.jl",
                                   "*/$jllname@$(major(version))/build_tarballs.jl")
                    pathmatches = split(readchomp(`find . -ipath $searchpath`), "\n", keepempty=false)
                    if length(pathmatches) == 1
                        buildscript = joinpath(yggy, pathmatches[1])
                        break
                    elseif length(pathmatches) > 1
                        error("found multiple build scripts for $jllname at Ygg $commit, got $pathmatches")
                    end
                end
            end
            !isfile(buildscript) && error("could not find build script for $jllname at Ygg $commit")
            @info "$jllname@$version: $buildscript @ $commit"
            # Now we can evaluate the buildscript at the time of this release's publication
            # but with `build_tarballs` shadowed to simply log the sources and products:
            m = Module(gensym())
            sources = []
            products = []
            dependencies = []
            cd(dirname(buildscript)) do
                @eval m begin
                    include(p) = Base.include($m, p)
                    using BinaryBuilder, Pkg
                    # Patch up support for old Products that used prefixes and avoid collisions with Base
                    _avoid_collisions(x::Symbol) = isdefined(Base, x) ? Symbol(x, :_is_not_defined_in_base) : x
                    LibraryProduct(x, varname, args...;kwargs...) = BinaryBuilder.LibraryProduct(x, _avoid_collisions(varname), args...; kwargs...)
                    LibraryProduct(prefix::String, name::String, var::Symbol, args...; kwargs...) = LibraryProduct([prefix*name], var, args...; kwargs...)
                    LibraryProduct(prefix::String, name::Vector{<:AbstractString}, var::Symbol, args...; kwargs...) = LibraryProduct(prefix.*name, var, args...; kwargs...)
                    ExecutableProduct(x, varname, args...;kwargs...) = BinaryBuilder.ExecutableProduct(x, _avoid_collisions(varname), args...; kwargs...)
                    ExecutableProduct(prefix::String, name::String, var::Symbol, args...; kwargs...) = ExecutableProduct([prefix*name], var, args...; kwargs...)
                    ExecutableProduct(prefix::String, name::Vector{<:AbstractString}, var::Symbol, args...; kwargs...) = ExecutableProduct(prefix.*name, var, args...; kwargs...)
                    FileProduct(x, varname, args...;kwargs...) = BinaryBuilder.FileProduct(x, _avoid_collisions(varname), args...; kwargs...)
                    FileProduct(prefix::String, name::String, args...; kwargs...) = FileProduct([prefix*name], args...; kwargs...)
                    FileProduct(prefix::String, name::Vector{<:AbstractString}, args...; kwargs...) = FileProduct(prefix.*name, args...; kwargs...)
                    # Ignore unknown FileSource kwargs (old versions supported an unpack_target kwarg)
                    FileSource(args...; kwargs...) = BinaryBuilder.FileSource(args...; filter((==)(:filename)∘first, kwargs)...)
                    # fancy_toys.jl used to define this with Pkg APIs that no longer work on v1.7. This defines it with a tighter signature than it used:
                    get_addable_spec(name::String, version::VersionNumber; kwargs...) = BinaryBuilder.BinaryBuilderBase.get_addable_spec(name, version; kwargs...)
                    # Just use the old Pkg BinaryPlatforms always; this is quite fragile/broken but the DB here ignores platform-specifics as much as possible
                    using Pkg.BinaryPlatforms: CompilerABI, UnknownPlatform, Linux, MacOS, Windows, FreeBSD, Platform
                    supported_platforms(; kwargs...) = BinaryBuilder.supported_platforms() # These kwargs require BinaryBuilder.Platforms
                    ARGS = []
                    expand_gcc_versions(p) = p isa AbstractVector ? p : [p]
                    prefix = ""
                    function build_tarballs(ARGS, src_name, src_version, sources, script, platforms, products, dependencies; kwargs...)
                        append!($sources, sources)
                        append!($dependencies, dependencies)
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
            end
            sources, products, dependencies
        end

        product_names(x::BinaryBuilder.LibraryProduct) = x.libnames
        product_names(x::BinaryBuilder.FrameworkProduct) = x.libraryproduct.libnames
        product_names(x::BinaryBuilder.ExecutableProduct) = x.binnames
        product_names(x::BinaryBuilder.FileProduct) = x.paths
        libs = unique(collect(Iterators.flatten(product_names.(filter(x->isa(x,Union{BinaryBuilder.LibraryProduct,BinaryBuilder.FrameworkProduct}), products)))))
        exes = unique(collect(Iterators.flatten(product_names.(filter(x->isa(x,BinaryBuilder.ExecutableProduct), products)))))
        files = unique(collect(Iterators.flatten(product_names.(filter(x->isa(x,BinaryBuilder.FileProduct), products)))))

        # Old binary builders toggled between gits and archives based on endswith(.git)
        # https://github.com/JuliaPackaging/BinaryBuilder.jl/blob/2b2c87be8a9ce47070d4ba92c91a3d0f4d4af2fc/src/wizard/obtain_source.jl#L95
        source_info(x::Pair{String, String}) = endswith(x[1], ".git") ? Dict("repo"=>x[1], "hash"=>x[2]) : Dict("url"=>x[1], "hash"=>x[2])
        source_info(x::AbstractString) = source_info(BinaryBuilder.DirectorySource(x))
        source_info(x::Union{BinaryBuilder.ArchiveSource, BinaryBuilder.FileSource}) = Dict("url"=>x.url, "hash"=>x.hash)
        source_info(x::BinaryBuilder.GitSource) = Dict("repo"=>x.url, "hash"=>x.hash)
        source_info(x::BinaryBuilder.DirectorySource) = Dict(
            "patches"=>string("https://github.com/JuliaPackaging/Yggdrasil/blob/", commit, "/", chopprefix(joinpath(dirname(buildscript), x.path), yggy)))
        srcs = unique(source_info.(sources))

        # We ignore runtime dependencies; those are in the Project/Manifest
        builddeps = unique([Dict(dict(x.pkg)..., "target"=>x isa BinaryBuilder.HostBuildDependency ? "host" : "target") for x in dependencies if !(x isa Union{String, BinaryBuilder.Dependency, BinaryBuilder.RuntimeDependency})])

        version_meta = get!(metadata, string(version), Dict{String,Any}())
        !isempty(libs) && (version_meta["libraries"] = libs)
        !isempty(exes) && (version_meta["executables"] = exes)
        !isempty(files) && (version_meta["files"] = files)
        !isempty(srcs) && (version_meta["sources"] = srcs)
        !isempty(builddeps) && (version_meta["build_dependencies"] = builddeps)
    end

    return metadata
end

function update_metadata(force = false)
    toml_path = joinpath(@__DIR__, "..", "..", "jll_metadata.toml")
    toml = try
        force && error()
        t = TOML.parsefile(toml_path)
        @info "updating toml with $(length(t)) entries"
        t
    catch
        @info "starting from scratch"
        Dict{String,Any}()
    end
    for (uuid, pkgentry) in jlls()
        if !haskey(toml, pkgentry.name)
            @info "populating $(pkgentry.name) from scratch"
            try
                toml[pkgentry.name] = metadata_for_jll(pkgentry)
            catch ex
                @error "error getting metadata for $(pkgentry.name)" ex
                ex isa HTTP.Exceptions.StatusError && ex.status == 403 && break
            end
        else
            toml_versions = keys(toml[pkgentry.name])
            version_info = Registry.registry_info(pkgentry).version_info
            reg_versions = string.(keys(version_info))
            missing_versions = setdiff(reg_versions, toml_versions)
            isempty(missing_versions) && continue
            @info "updating $(pkgentry.name) for $missing_versions"
            try
                updates = metadata_for_jll(pkgentry, filter(((k,v),)->string(k) in missing_versions, version_info))
                merge!(toml[pkgentry.name], updates)
            catch ex
                @error "error getting metadata for $(pkgentry.name) at some versions" ex missing_versions
                ex isa HTTP.Exceptions.StatusError && ex.status == 403 && break
            end
        end
    end
    @info "writing toml with $(length(toml)) entries"
    open(toml_path,"w") do f
        println(f, "#############################################################################")
        println(f, "# This file is autogenerated by scripts/jll_metadata/update_jll_metadata.jl #")
        println(f, "###################### Do not manually edit this file! ######################")
        println(f, "#############################################################################")
        TOML.print(f, toml, sorted=true, by=x->something(tryparse(VersionNumber, x), x))
    end
    return toml
end

if abspath(PROGRAM_FILE) == @__FILE__
    update_metadata()
end

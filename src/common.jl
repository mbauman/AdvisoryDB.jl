using JSON3: JSON3
using TOML: TOML
using Pkg: Pkg, Registry
using Tar: Tar
using CodecZlib: GzipDecompressorStream
using DataStructures: OrderedDict as Dict

exists(advisory, key) = haskey(advisory, key) && is_populated(getproperty(advisory, key))
exists(advisory, key, keys...) = exists(advisory, key) && exists(advisory, keys...)
is_populated(::Nothing) = false
is_populated(::Missing) = false
is_populated(s::AbstractString) = !isempty(strip(s))
is_populated(A::AbstractArray) = !isempty(A)
is_populated(d::AbstractDict) = !isempty(d)
is_populated(::Any) = true

"""
    VersionIshNumber

A not-necessarily-SemVer version number that implements version-like
lexicographic splitting at punctuation and numeric-like comparisons
of digits without assuming anything about the structure of the string
itself.
"""
struct VersionIshNumber
    str::String
    parts::Vector{String}
end
VersionIshNumber(str) = VersionIshNumber(strip(str), version_parts(strip(str)))
Base.tryparse(::Type{VersionIshNumber}, str) = VersionIshNumber(str)
Base.:(==)(a::VersionIshNumber, b::VersionIshNumber) = a.str == b.str
Base.hash(a::VersionIshNumber, h::UInt) = hash(a.str, hash(0x30eeab00fd453583, h))
function Base.isless(a::VersionIshNumber, b::VersionIshNumber)
    # By splitting parts, we can _mostly_ lean on lexicographic comparison. But
    # parts that start with a `-` are special; they typically count as pre-releases
    # of a given version and should sort _before_ the matched part. We've already
    # swapped them to `\0` here.
    matched_len = min(length(a.parts), length(b.parts))
    return isless(a.parts[1:matched_len], b.parts[1:matched_len]) ||
           (a.parts[1:matched_len] == b.parts[1:matched_len] && (
                isless(length(a.parts), length(b.parts)) ||
                startswith(a.parts[matched_len+1], "\0")))
end
function Base.show(io::IO, a::VersionIshNumber)
    show(io, typeof(a))
    print(io, "(")
    show(io, a.str)
    print(io, ")")
    return nothing
end
Base.print(io::IO, a::VersionIshNumber) = print(io, a.str)
Base.typemin(::Type{VersionIshNumber}) = VersionIshNumber("")
Base.typemax(::Type{VersionIshNumber}) = VersionIshNumber("\U10FFFF∞")

explode_int(::Nothing) = nothing
explode_int(d::Integer) = string(d, pad=19)
explode_digits(x) = something(explode_int(tryparse(Int, x)), x)
# For somewhat coherent version sorting in the absence of real semver
function version_parts(verstr)
    parts = split(verstr, r"(?=[\-.])") # Keep the splitter itself as part of the comparison
    exploded_parts = [join(explode_digits(subpart) for subpart in split(part, r"(?<=\d)(?=[^\d])|(?<=[^\d])(?=\d)")) for part in parts]
    # Parts that start with - are special; they must sort before everything else
    return replace.(exploded_parts, r"^-"=>"\0")
end

struct VersionRange{V<:Union{VersionNumber, VersionIshNumber}}
    lb::V
    ub::V
    lbinclusive::Bool
    ubinclusive::Bool
end
VersionRange(x::AbstractString) = VersionRange{VersionIshNumber}(x)
VersionRange{T}(x::AbstractString) where {T<:Union{VersionNumber, VersionIshNumber}} = something(tryparse(VersionRange{T}, x))
function Base.in(x::T, r::VersionRange{T}) where {T<:Union{VersionNumber, VersionIshNumber}}
    return (r.lbinclusive ? x >= r.lb : x > r.lb) &&
           (r.ubinclusive ? x <= r.ub : x < r.ub)
end
function Base.:(<)(x::T, r::VersionRange{T}) where {T<:Union{VersionNumber, VersionIshNumber}}
    return (r.lbinclusive ? x < r.lb : x <= r.lb)
end
function Base.:(>)(x::T, r::VersionRange{T}) where {T<:Union{VersionNumber, VersionIshNumber}}
    return (r.ubinclusive ? x > r.ub : x >= r.ub)
end
Base.:(<)(a::VersionRange, b::VersionRange) = a.lb < b.lb || (a.lb == b.lb && !a.lbinclusive < !b.lbinclusive) || (a.lb == b.lb && a.ub < b.ub)
Base.tryparse(::Type{VersionRange}, x::AbstractString) = tryparse(VersionRange{VersionIshNumber}, x)
function Base.tryparse(::Type{VersionRange{V}}, arg::AbstractString) where {V}
    # This supports parsing both GitHub and EUVD-like range syntaxes.
    # GHSA range format is described at:
    #   https://docs.github.com/en/graphql/reference/objects#securityvulnerability
    #   "= 0.2.0" denotes a single vulnerable version.
    #   "<= 1.0.8" denotes a version range up to and including the specified version
    #   "< 0.1.11" denotes a version range up to, but excluding, the specified version
    #   ">= 4.3.0, < 4.3.5" denotes a version range with a known minimum and maximum version.
    #   ">= 0.0.1" denotes a version range with a known minimum, but no known maximum.
    #   (Undocumented) ">" is also a valid operator.
    # EUVD does something similar, albeit with unicode equivalents (≤ and maybe ≥?) and an optional
    #   inclusive lower bound on the LHS of a less-than operator
    # The special string "*" denotes all versions
    str = strip(arg)
    if str == "*"
        return VersionRange{V}(typemin(V), typemax(V), true, true)
    elseif startswith(str, "=")
        # An exact version number
        v = tryparse(V, strip(chopprefix("=", str)))
        isnothing(v) && return nothing
        return VersionRange{V}(v, v, true, true)
    elseif startswith(str, r"[<≤]")
        # An upper bound only, with an implicit minimum lower bound
        ub = tryparse(V, strip(chopprefix(str, r"(?:<=|≤|<)")))
        isnothing(ub) && return nothing
        return VersionRange{V}(typemin(V), ub, true, startswith(str, r"(?:<=|≤)"))
    elseif startswith(str, r"[>≥]")
        # A lower bound that may have a comma-separated upper bound that follows
        parts = split(str, r",\s*(?=[<≤])", limit=2, keepempty=false)
        lower, upper = parts[1], get(parts, 2, string("<=",typemax(V)))
        lb = tryparse(V, strip(chopprefix(lower, r"(?:>=|≥|>)")))
        isnothing(lb) && return nothing
        ub = tryparse(V, strip(chopprefix(upper, r"(?:<=|≤|<)")))
        isnothing(ub) && return nothing
        return VersionRange{V}(lb, ub, startswith(lower, r"(?:>=|≥)"), startswith(upper, r"(?:<=|≤)"))
    elseif count(in(('<','≤')), str) == 1 && !contains(str, ",")
        # This is an EUVD-style range, with in inclusive lower bound and an upper bound
        lower, upper = split(str, r"\s*(?=[<≤])", limit=2, keepempty=false)
        lb = tryparse(V, strip(lower))
        isnothing(lb) && return nothing
        ub = tryparse(V, strip(chopprefix(upper, r"(?:<=|≤|<)")))
        isnothing(ub) && return nothing
        return VersionRange{V}(lb, ub, true, startswith(upper, r"(?:<=|≤)"))
    end
    return nothing
end
function Base.show(io::IO, r::VersionRange)
    show(io, typeof(r))
    print(io, "(")
    show(io, string(r))
    print(io, ")")
    return nothing
end
has_lower_bound(r::VersionRange{T}) where {T} = !(r.lb == typemin(T) && r.lbinclusive)
has_upper_bound(r::VersionRange{T}) where {T} = !(r.ub == typemax(T) && r.ubinclusive)
function Base.print(io::IO, r::VersionRange)
    if has_lower_bound(r)
        print(io, r.lbinclusive ? ">=" : ">", " ", r.lb)
    end
    if has_upper_bound(r)
        has_lower_bound(r) && print(io, ", ")
        print(io, r.ubinclusive ? "<=" : "<", " ", string(r.ub))
    end
    if !has_lower_bound(r) && !has_upper_bound(r)
        print(io, "*")
    end
end


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

function uuids_from_name(name, reg=get_registry())
    Registry.uuids_from_name(reg, name)
end
registry_has_package(name, reg=get_registry()) = !isempty(uuids_from_name(reg, name))

available_versions_for_uuid(uuid) = available_versions_for_uuid(Base.UUID(uuid))
function available_versions_for_uuid(uuid::Base.UUID, reg=get_registry())
    info = Registry.registry_info(reg[uuid])
    return sort(collect(keys(info.version_info)))
end

function untar_readmes(tar_gz::AbstractString)
    data = String[]
    buf = Vector{UInt8}(undef, Tar.DEFAULT_BUFFER_SIZE)
    io = IOBuffer()
    open(tar_gz) do compressed_tar
        tar = GzipDecompressorStream(compressed_tar)
        Tar.read_tarball(x->contains(lowercase(x.path), "readme"), tar; buf=buf) do hdr, _
            if hdr.type == :file
                Tar.read_data(tar, io; size=hdr.size, buf=buf)
                push!(data, String(take!(io)))
            end
        end
    end
    return join(data, "\n")
end


function readme_for_pkg(name, uuid, version; reg=get_registry())
    # We intentionally side-step the package resolver here, but still lean on the Pkg server
    tree_hash = reg[uuid].info.version_info[version].git_tree_sha1
    server, _ = Registry.pkg_server_registry_info()
    tarball = download("$server/package/$uuid/$tree_hash")
    return untar_readmes(tarball)
end

const CPE_CONFIG = Ref{Dict{String,Any}}()
cpe_config() = isdefined(CPE_CONFIG,1) ? CPE_CONFIG[] : (CPE_CONFIG[] = TOML.parsefile(joinpath(@__DIR__, "..", "cpe_config.toml")))
upstream_versions_for_package(pkgname) = Dict(string(v)=>upstream_versions_for_package(pkgname, v) for v in available_versions_for_uuid(only(uuids_from_name(pkgname))))
function upstream_versions_for_package(pkgname, version; force=false)
    cpe_map = TOML.parsefile(joinpath(@__DIR__, "..", "cpe_map.toml"))
    if !force && haskey(cpe_map, pkgname) && haskey(cpe_map[pkgname], version)
        return cpe_map[pkgname][string(version)]
    end
    config = cpe_config()
    # First check for overrides
    results = Dict{String, String}()
    if pkgname in keys(config["overrides"]) && string(version) in keys(config["overrides"][pkgname])
        merge!(results, config["overrides"][pkgname][string(version)])
    end
    # Then check for readme patterns
    uuid = only(uuids_from_name(pkgname))
    r = readme_for_pkg(pkgname, uuid, version)
    for (regex, cpe) in config["readme-regexes"]
        m = match(Regex(regex), r)
        isnothing(m) && continue
        results[cpe] = m.captures[1]
    end
    open("cpe_map.toml","w") do f
        println(f, "# This file is autogenerated; use cpe_config.toml to adjust it")
        haskey(cpe_map, pkgname) || (cpe_map[pkgname] = Dict{String, Any}())
        cpe_map[pkgname][string(version)] = results
        TOML.print(f, cpe_map, sorted=true, by=x->something(tryparse(VersionNumber, x), x))
    end
    return results
end

const AVAILABLE_CPES = Pair{String,String}[]
function available_cpes()
    if isempty(AVAILABLE_CPES)
        cpe_map = TOML.parsefile(joinpath(@__DIR__, "..", "cpe_map.toml"))
        for (pkg, vers) in cpe_map
            for cpe in unique(Iterators.flatten(keys.(values(vers))))
                push!(AVAILABLE_CPES, cpe => pkg)
            end
        end
        sort!(AVAILABLE_CPES)
    end
    return AVAILABLE_CPES
end

function package_cpe_version_map(pkg, cpe)
    cpe_map = TOML.parsefile(joinpath(@__DIR__, "..", "cpe_map.toml")) # TODO: cache me
    return Dict(k=>v[cpe] for (k,v) in cpe_map[pkg] if haskey(v, cpe))
end

function related_julia_packages(description, vendorproductversions)
    pkgs = Pair{String,String}[]
    jlpkgs_mentioned = union((m.captures[1] for m in eachmatch(r"\b(\w+)\.jl\b", description)),
                             (m.captures[1]*"_jll" for m in eachmatch(r"\b(\w+)_jll\b", description)))
    for (vendor, product, version) in vendorproductversions
        # First check for a known **NON-JULIA-PACKAGE** CPE:
        cpe = string("cpe:2.3:a:", lowercase(vendor), ":", lowercase(product))
        matched_cpes = available_cpes()[searchsorted(available_cpes(), cpe=>"", by=lowercase∘first)]
        if !isempty(matched_cpes)
            # We have an upstream component! Make an educated guess at the remapped version range if we can.
            for (cpe, pkg) in matched_cpes
                r = tryparse(VersionRange, version)
                if isnothing(r)
                    push!(pkgs, string(cpe, "|", pkg) => version) # We don't know how to parse this version! Use a fake package name to flag this
                else
                    versionmap = sort(collect(package_cpe_version_map(pkg, cpe)), by=((pkg_version,cpe_version),)->(VersionIshNumber(cpe_version), VersionNumber(pkg_version)))
                    # Find the extremes of Julia versions that are in the range; note that it might be possible for a version
                    # in between the extremes to be outside the range, but we don't care. We'll assume all versions within
                    # the extremese are vulnerable.
                    firstidx = findfirst(in(r), VersionIshNumber.(last.(versionmap)))
                    isnothing(firstidx) && continue # No vulnerable versions were ever registered
                    lastidx = something(findlast(in(r), VersionIshNumber.(last.(versionmap))))
                    firstversion = firstidx == firstindex(versionmap) ? typemin(VersionNumber) : VersionNumber(versionmap[firstidx][1])
                    lastversion  = lastidx+1 >  lastindex(versionmap) ? typemax(VersionNumber) : VersionNumber(versionmap[lastidx+1][1])
                    push!(pkgs, pkg => string(VersionRange(firstversion, lastversion, true, false)))
                end
            end
        elseif (contains(lowercase(vendor), "julia") || endswith(product, ".jl")) && registry_has_package(chopsuffix(product, ".jl"))
            # A vendor or package _looks_ really julia-ish and is in the registry
            push!(pkgs, chopsuffix(product, ".jl") => version)
        elseif !isempty(jlpkgs_mentioned)
            # There are packages mentioned in the description! First look for a possible match against the given product
            matched_product = false
            for pkg in jlpkgs_mentioned
                (pkg == chopsuffix(product, ".jl") && registry_has_package(pkg)) || continue
                push!(pkgs, pkg => version)
                matched_product = true
                break
            end
            if !matched_product
                # Just tag all mentioned packages with the given version info. If there's more than one
                # mentioned, it's likely that only one applies to this particular version. But we don't know
                append!(pkgs, jlpkgs_mentioned .=> version)
            end
        end
    end
    # Combine all versions for a given package into an array
    unique_pkg_names = unique(first.(pkgs))
    return [p => last.(pkgs[first.(pkgs) .== p]) for p in unique_pkg_names]
end

# TODO: use the above Pkg machinery for this, too
const ALL_PKGS = Pair{String,String}[]
function all_pkgs(toml_url = "https://github.com/JuliaRegistries/General/raw/refs/heads/master/Registry.toml")
    if isempty(ALL_PKGS)
        # This should really use Pkg APIs, but they are non-trivial and were hanging on GitHub Actions?
        registry = TOML.parsefile(download(toml_url))
        append!(ALL_PKGS, sort!([info["name"]=>uuid for (uuid, info) in registry["packages"]]))
    end
    return ALL_PKGS
end
function get_uuids_in_general(pkgname)
    pkgs = all_pkgs()
    idxs = searchsorted(pkgs, pkgname=>"", by=first)
    return last.(getindex.((pkgs,), idxs))
end
function all_jlls()
    pkgs = all_pkgs()
    filter(endswith("_jll")∘first, pkgs)
end

function get_packages(osv)
    pkgs = Tuple{String,String}[]
    id = osv.id
    println("Looking for Julia packages in $id")
    if haskey(osv, :affected) && !isempty(osv.affected)
        for vuln in osv.affected
            if haskey(vuln, :package) && haskey(vuln.package, :name) && haskey(vuln.package, :ecosystem)
                lowercase(string(vuln.package.ecosystem)) == "julia" || continue
                pkgname = chopsuffix(strip(vuln.package.name), ".jl")
                println(" - looking for $pkgname in the General registry")
                uuids = get_uuids_in_general(pkgname)
                if length(uuids) != 1
                    println(" ⨯ found $(length(uuids)) UUIDs for $pkgname")
                    create_issue(ENV["GITHUB_REPOSITORY"],
                        title="Failed to find a registered $(pkgname) for $is",
                        body="""
                            The advisory $id names **$pkgname** as an affected product from the
                            Julia ecosystem, but $(isempty(uuids) ? "no" : "more than one") match was found
                            in the General registry.

                            The complete OSV advisory is:

                            ```json
                            $(sprint((io,x)->JSON3.pretty(io, x, JSON3.AlignmentContext(indent=2)), osv))
                            ```
                            """
                    )
                else
                    println(" - found $pkgname => $(only(uuids))")
                    push!(pkgs, (pkgname, only(uuids)))
                end
            end
        end
    end
    return pkgs
end

function import_osv_files(path)
    packages_dir = "packages/General"
    n = 0
    for filename in readdir(path)
        endswith(filename, ".json") || continue

        osv_data = JSON3.read(joinpath(path, filename))

        for (package, uuid) in get_packages(osv_data)
            package_dir = joinpath(packages_dir, package)
            mkpath(package_dir)

            filename = "$(osv_data.id).json"
            filepath = joinpath(package_dir, filename)

            println("Writing advisory: $filepath")
            open(filepath, "w") do f
                JSON3.pretty(f, osv_data, JSON3.AlignmentContext(indent=2))
            end
            n += 1
        end
    end

    println("Completed writing $n advisories to disk")
end

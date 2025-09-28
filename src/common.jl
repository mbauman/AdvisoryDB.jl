using JSON3: JSON3
using TOML: TOML
using Pkg: Pkg, Registry
using Tar: Tar
using CodecZlib: GzipDecompressorStream
using DataStructures: OrderedDict, DefaultDict
using Dates: Dates
using TimeZones: TimeZones

const PREFIX="DONOTUSEJLSEC"

exists(advisory, key) = haskey(advisory, key) && is_populated(advisory[key])
exists(advisory, key, keys...) = exists(advisory, key) && exists(advisory, keys...)
is_populated(::Nothing) = false
is_populated(::Missing) = false
is_populated(s::AbstractString) = !isempty(strip(s))
is_populated(A::AbstractArray) = !isempty(A)
is_populated(d::AbstractDict) = !isempty(d)
is_populated(::Any) = true

struct VersionRange{V<:Union{VersionNumber, VersionString}}
    lb::V
    ub::V
    lbinclusive::Bool
    ubinclusive::Bool
end
VersionRange(x::AbstractString) = VersionRange{VersionString}(x)
VersionRange{T}(x::AbstractString) where {T<:Union{VersionNumber, VersionString}} = something(tryparse(VersionRange{T}, x))
function Base.in(x::T, r::VersionRange{T}) where {T<:Union{VersionNumber, VersionString}}
    return (r.lbinclusive ? x >= r.lb : x > r.lb) &&
           (r.ubinclusive ? x <= r.ub : x < r.ub)
end
function Base.:(<)(x::T, r::VersionRange{T}) where {T<:Union{VersionNumber, VersionString}}
    return (r.lbinclusive ? x < r.lb : x <= r.lb)
end
function Base.:(>)(x::T, r::VersionRange{T}) where {T<:Union{VersionNumber, VersionString}}
    return (r.ubinclusive ? x > r.ub : x >= r.ub)
end
Base.:(==)(a::VersionRange, b::VersionRange) = (==)((a.lb, a.lbinclusive, a.ub, a.ubinclusive), (b.lb, b.lbinclusive, b.ub, b.ubinclusive))
Base.hash(a::VersionRange, h::UInt) = hash((a.lb, a.lbinclusive, a.ub, a.ubinclusive), hash(0x80ebd9334ee9e2b1, h))
Base.isless(a::VersionRange, b::VersionRange) = isless((a.lb, !a.lbinclusive, a.ub, a.ubinclusive), (b.lb, !b.lbinclusive, b.ub, b.ubinclusive))
Base.tryparse(::Type{VersionRange}, x::AbstractString) = tryparse(VersionRange{VersionString}, x)
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
        v = tryparse(V, strip(chopprefix(str, "=")))
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
    if r.lb == r.ub && r.lbinclusive && r.ubinclusive
        print(io, "= ", r.lb)
    elseif !has_lower_bound(r) && !has_upper_bound(r)
        print(io, "*")
    else
        if has_lower_bound(r)
            print(io, r.lbinclusive ? ">=" : ">", " ", r.lb)
        end
        if has_upper_bound(r)
            has_lower_bound(r) && print(io, ", ")
            print(io, r.ubinclusive ? "<=" : "<", " ", string(r.ub))
        end
    end
end
# Simple helpers for sorting correctly
lower_bound_tuple(r::VersionRange) = (r.lb, !r.lbinclusive) # inclusive lower bounds are smaller than exclusive ones — they include a smaller version than their exclusive counterparts
upper_bound_tuple(r::VersionRange) = (r.ub, r.ubinclusive)  # whereas inclusive upper bounds are bigger — they include a bigger version
function overlaps(a::VersionRange, b::VersionRange)
    smaller, bigger = a < b ? (a, b) : (b, a)
    # Ranges order by lower bound then upper bound, so the "smaller" range overlaps the "bigger" one if:
    # their lower bounds are the same, or the upper bound of the smaller one reaches into the bigger one
    return (lower_bound_tuple(smaller) == lower_bound_tuple(bigger) ||
            upper_bound_tuple(smaller) >= lower_bound_tuple(bigger))
end
function merge_ranges(ranges)
    ranges = issorted(ranges) ? ranges : sort(ranges)
    new_ranges = eltype(ranges)[]
    base = nothing
    for rng in ranges
        base === nothing && (base = rng; continue) # first iteration
        # Incrementally widen `base` to "gobble up" any subsequent ranges it overlaps or _touches_ (if at least one endpoint is inclusive)
        if overlaps(base, rng) || (base.ub == rng.lb && (base.ubinclusive || rng.lbinclusive))
            ubtuple = max(upper_bound_tuple(base), upper_bound_tuple(rng))
            base = VersionRange(base.lb, ubtuple[1], base.lbinclusive, ubtuple[2])
        else
            push!(new_ranges, base)
            base = rng
        end
    end
    base !== nothing && push!(new_ranges, base)
    return new_ranges
end

function osv_events(rngs)
    allequal(r->r.ubinclusive, filter(has_upper_bound, rngs)) || throw(ArgumentError("OSV schema doesn't support mixed inclusive/exclusive upper bounds"))
    return collect(Iterators.flatten(osv_events(rng) for rng in sort(rngs)))
end
function osv_events(rng::VersionRange)
    events = []
    rng.lbinclusive || throw(ArgumentError("OSV schema doesn't support exclusive lower bounds; they must be normalized to the (inclusive) first-introduced version"))
    push!(events, Dict("introduced"=>has_lower_bound(rng) ? string(rng.lb) : "0"))
    if has_upper_bound(rng)
        if rng.ubinclusive
            push!(events, Dict("last_affected"=>string(rng.ub)))
        else
            push!(events, Dict("fixed" => string(rng.ub)))
        end
    end # Otherwise we lean on the implicit "limit" = "*" event
    return events
end

function extract_summary(description)
    N = lastindex(description)
    double_newline = something(findfirst("\n\n", description), N:N)[1]
    if double_newline < 100
        return strip(chopprefix(description[1:double_newline], r"^#+"))
    end

    flat_description = replace(description, r"\s+"=>" ")
    summary_end = findfirst(". ", flat_description)
    if summary_end !== nothing && summary_end[1] < 100
        flat_description[1:prevind(flat_description, summary_end[1])]
    else
        flat_description[1:min(thisind(flat_description, 100), end)] * "..."
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
    name == "julia" && return Base.UUID[]
    Registry.uuids_from_name(reg, string(name))
end
registry_has_package(name, reg=get_registry()) = !isempty(uuids_from_name(name, reg))

available_versions_for_uuid(uuid) = available_versions_for_uuid(Base.UUID(uuid))
function available_versions_for_uuid(uuid::Base.UUID, reg=get_registry())
    version_info = Registry.registry_info(reg[uuid]).version_info
    return sort([version for (version, info) in version_info if !info.yanked])
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

# The two primary datastructures for connecting packages with upstream projects
const PACKAGE_COMPONENTS = Ref{Dict{String,Any}}()
package_components() = isassigned(PACKAGE_COMPONENTS) ? PACKAGE_COMPONENTS[] :
    (PACKAGE_COMPONENTS[] = TOML.parsefile(joinpath(@__DIR__, "..", "package_components.toml")))

const UPSTREAM_PROJECTS = Ref{Dict{String,Any}}()
upstream_projects() = isassigned(UPSTREAM_PROJECTS) ? UPSTREAM_PROJECTS[] :
    (UPSTREAM_PROJECTS[] = TOML.parsefile(joinpath(@__DIR__, "..", "upstream_project_info.toml")))

# A computed dictionary that maps a (vendor, product) tuple to a known upstream project name
const UPSTREAM_PROJECTS_BY_VENDOR_PRODUCT = Ref{Dict{Tuple{String,String}, String}}()
function upstream_projects_by_vendor_product()
    isassigned(UPSTREAM_PROJECTS_BY_VENDOR_PRODUCT) && return UPSTREAM_PROJECTS_BY_VENDOR_PRODUCT[]
    d = Dict{Tuple{String,String}, String}()
    for (project, deets) in upstream_projects()
        products = unique(skipmissing(vcat(project, get(split(get(deets, "cpe", ""), ":"), 5, missing))))
        vendors = unique(skipmissing(vcat(get(deets, "vendors", String[]), get(split(get(deets, "cpe", ""), ":"), 4, missing))))
        for v in vendors, p in products
            haskey(d, (lowercase(v),lowercase(p))) && d[(lowercase(v),lowercase(p))] != project && error("every vendor/product pair must uniquely identify (case-insensitive) one upstream projects")
            d[(lowercase(v),lowercase(p))] = project
        end
    end
    UPSTREAM_PROJECTS_BY_VENDOR_PRODUCT[] = d
end

function packages_with_project(proj)
    return [pkgname for (pkgname,versioninfo) in package_components() if any(v->haskey(v,proj), values(versioninfo))]
end



function upstream_versions_used_by_cpe(cpe)
    # First find the projects that match the CPE:
    upstream_projects = TOML.parsefile(joinpath(@__DIR__, "..", "upstream_project_info.toml"))
    matched_projects = [k for (k,v) in upstream_projects if cpe == get(v, "cpe", nothing)]
    # Then the _upstream_ versions of that project that are used by JLLs
    upstream_components = TOML.parsefile(joinpath(@__DIR__, "..", "package_components.toml"))
    versions = []
    for (_, pkgversions) in upstream_components
        for (_, components) in pkgversions
            for (k, v) in components
                k in matched_projects && push!(versions, v)
            end
        end
    end
    return unique(versions)
end

function package_project_version_map(pkg, proj)
    return Dict(v => components[proj] for (v, components) in package_components()[pkg])
end

"""
    convert_versions(pkg_project_map, vulnerable_range)

Convert the vulnerable range from an upstream project's version numbers to the Julia packages,
using the pkg_project_map.

In practice, this uses the `package_components.toml` table and a vulnerable range from an upstream advisory.
"""
function convert_versions(pkg_project_map, vulnerable_range)
    versionmap = sort([VersionNumber(k) => v for (k,v) in pkg_project_map], by=first)

    versions = VersionRange{VersionNumber}[]
    # Now walk through the Julia package's versions and push all applicable (potentially disjoint) ranges of versions
    #
    # There are two hard things we need to support in the pkg_project_map:
    #   * Unknown versions are marked by "*" — we assume they're any versions between the known bounds
    #   * There may be more than one upstream version on varying platforms. It may be String or String[]
    first_vulnerable = v"0-"
    last_vulnerable = nothing
    last_known_ver = VersionString("")
    last_unknown = nothing
    skipped_unknowns = false
    for (pkgver, ver) in versionmap
        # Gather up sequential *s to cover their bounds
        if ver == "*"
            first_vulnerable = something(first_vulnerable, pkgver)
            last_unknown = pkgver
            skipped_unknowns = true
            continue
        end

        if skipped_unknowns && overlaps(vulnerable_range, VersionRange(last_known_ver, ver isa AbstractString ? VersionString(ver) : isempty(ver) ? VersionString("∞") : maximum(VersionString.(ver)), true, false))
            last_vulnerable = last_unknown
        end

        if any(in.(VersionString.(ver), (vulnerable_range,)))
            first_vulnerable = something(first_vulnerable, pkgver)
            last_vulnerable = pkgver
        else
            if last_vulnerable !== nothing
                push!(versions, VersionRange(first_vulnerable, pkgver, true, false))
            end
            first_vulnerable = last_vulnerable = nothing
        end
        last_known_ver = ver isa AbstractString ? VersionString(ver) : isempty(ver) ? VersionString("") : minimum(VersionString.(ver))
        skipped_unknowns = false
    end
    if first_vulnerable !== nothing && last_vulnerable !== nothing || (skipped_unknowns && overlaps(vulnerable_range, VersionRange(last_known_ver, typemax(VersionString), true, true)))
        push!(versions, VersionRange(first_vulnerable, v"∞", true, true))
    end
    versions
end

function affected_julia_packages(description, vendorproductversions)
    pkgs = DefaultDict{String, Any}(()->DefaultDict{String, Any}(()->OrderedDict{String, Any}()))
    # There are three reasons why this might return a ["*"] range
    # 1. That's the correct answer
    # 2. It's pessimistically returned because we failed to parse the versions reported in the advisory
    # 3. It's pessimistically returned because we failed to match a mentioned Julia package to a product
    julia_like_pkgs_mentioned = union((m.captures[1] for m in eachmatch(r"\b(\w+)\.jl\b", description)),
                                      (m.captures[1]*"_jll" for m in eachmatch(r"\b(\w+)_jll\b", description)))
    jlpkgs_mentioned = filter(registry_has_package, julia_like_pkgs_mentioned)
    found_match = false
    advisory_type = nothing
    for (vendor, product, version) in unique(vendorproductversions)
        # First check for a known **NON-JULIA-PACKAGE** CPE:
        if haskey(upstream_projects_by_vendor_product(), (lowercase(vendor), lowercase(product)))
            matched_project = upstream_projects_by_vendor_product()[(lowercase(vendor), lowercase(product))]
            found_match = true
            # We have an upstream component! Compute the remapped version range if we can.
            matched_pkgs = packages_with_project(matched_project)
            r = tryparse(VersionRange, version)
            for pkg in matched_pkgs
                pkgs[pkg]["$vendor:$product"][version] = isnothing(r) ?
                    [VersionRange{VersionNumber}("*")] : convert_versions(package_project_version_map(pkg, matched_project), r)
            end
            isnothing(advisory_type) || @assert(advisory_type == "upstream", "advisory directly lists $pkg, but it also finds upstream components")
            advisory_type = "upstream"
        else
            if (contains(lowercase(vendor), "julia") || endswith(product, ".jl")) && registry_has_package(chopsuffix(product, ".jl"))
                # A vendor or package _looks_ really julia-ish and is in the registry
                found_match = true
                r = tryparse(VersionRange{VersionNumber}, version)
                pkg = chopsuffix(product, ".jl")
                pkgs[pkg]["$vendor:$product"][version] = [something(r, VersionRange{VersionNumber}("*"))]
                isnothing(advisory_type) || @assert(advisory_type == "alias", "advisory directly lists $pkg, but it also finds upstream components")
                advisory_type = "alias"
            elseif !isempty(jlpkgs_mentioned)
                # There are packages mentioned in the description! First look for a possible match against the given product
                for pkg in jlpkgs_mentioned
                    pkg == chopsuffix(product, ".jl") || continue
                    found_match = true
                    r = tryparse(VersionRange{VersionNumber}, version)
                    pkgs[pkg]["$vendor:$product"][version] = [something(r, VersionRange{VersionNumber}("*"))]
                    isnothing(advisory_type) || @assert(advisory_type == "alias", "advisory directly lists $pkg, but it also finds upstream components")
                    advisory_type = "alias"
                    break
                end
            end
        end
    end
    if !found_match && !isempty(jlpkgs_mentioned)
        # We didn't connect any vendor/product pair with a Julia package, but there are some mentioned.
        # TODO: this could potentially do better by trying to correlate the listed versions against
        # the registered ones, but this is quite the rare case and not worth worrying too much about
        @warn "failed to match the mentioned packages to a product with a version"
        @warn "assuming that all mentioned products are vulnerable at all versions"
        for pkg in jlpkgs_mentioned
            for (vendor, product, version) in unique(vendorproductversions)
                pkgs[pkg]["$vendor:$product"][version] = [VersionRange{VersionNumber}("*")]
            end
        end
        advisory_type = "alias"
    end

    # return pkgs
    vulns = PackageVulnerability[]
    for (pkg, source_mapping) in pkgs
        # Use a better sorting if we can:
        for (_, vs) in source_mapping
            if all(!isnothing, tryparse.(VersionRange, keys(vs)))
                sort!(vs, by=x->something(tryparse(SecurityAdvisories.VersionRange, x), x))
            else
                sort!(vs)
            end
        end
        push!(vulns, PackageVulnerability(pkg,
            merge_ranges(sort(collect(Iterators.flatten(v for (proj,map) in source_mapping for (_,v) in map)))),
            advisory_type,
            source_mapping))
    end
    return vulns
end

# TODO: use the above Pkg machinery for this, too
const ALL_PKGS = Pair{String,String}[]
function all_pkgs(toml_urls = ["https://github.com/JuliaRegistries/General/raw/refs/heads/master/Registry.toml",
     "https://github.com/JuliaLang/julia/raw/refs/heads/master/stdlib/Project.toml"])
    if isempty(ALL_PKGS)
        for toml_url in toml_urls
            # This should really use Pkg APIs, but they are non-trivial and were hanging on GitHub Actions?
            registry = TOML.parsefile(download(toml_url))
            if haskey(registry, "packages")
                append!(ALL_PKGS, [info["name"]=>uuid for (uuid, info) in registry["packages"]])
            elseif haskey(registry, "deps")
                append!(ALL_PKGS, registry["deps"])
            else
                @warn "Unexpected Pkg toml found at $toml_url"
            end
        end
        sort!(ALL_PKGS)
    end
    return ALL_PKGS
end
function get_uuids_in_general_stdlib(pkgname)
    pkgs = all_pkgs()
    idxs = searchsorted(pkgs, pkgname=>"", by=first)
    return last.(getindex.((pkgs,), idxs))
end
function all_jlls()
    pkgs = all_pkgs()
    filter(endswith("_jll")∘first, pkgs)
end
"""
    find_existing_jlsec(id, aliases=String[])

Given an advisory id and an (optional) list of its own aliases, return the published
JLSEC advisory corresponding to it or nothing none correspond.
"""
function find_existing_jlsec(id, aliases=String[]; path=joinpath(@__DIR__, "..", "advisories", "published"))
    startswith(id, string(PREFIX, "-2")) && return id # lol y3k problems
    isdir(path) || return nothing
    ids = Set(Iterators.flatten((id, aliases)))
    for (root, _, files) in walkdir(joinpath(@__DIR__, "..", "advisories"))
        for file in joinpath.(root, files)
            is_jlsec_advisory_path(file) || continue
            candidate = parsefile(file)
            for alias in Iterators.flatten((candidate.id, candidate.aliases, candidate.upstream))
                alias in ids && return parsefile(file)
            end
        end
    end
    return nothing
end

"""
    is_jlsec_advisory_path_path(path)

Given a path, do a simple check to see if it looks like a JLSEC advisory
"""
function is_jlsec_advisory_path(path)
    file, ext = splitext(basename(path))
    return startswith(file, PREFIX) && ext == ".md"
end

function fetch_advisory(advisory_id)
    if startswith(advisory_id, "CVE-")
        vuln = NVD.fetch_cve(advisory_id)
        return NVD.advisory(vuln)
    elseif startswith(advisory_id, "EUVD-")
        vuln = EUVD.fetch_enisa(advisory_id)
        return EUVD.advisory(vuln)
    elseif endswith(advisory_id, r"GHSA-\w{4}-\w{4}-\w{4}")
        vuln = GitHub.fetch_ghsa(advisory_id)
        return GitHub.advisory(vuln)
    else
        throw(ArgumentError("unknown advisory: $advisory_id"))
    end
end

function fetch_product_matches(vendor, product)
    cpe = "cpe:2.3:a:$vendor:$product"
    nvds = NVD.fetch_cpe_matches(cpe)
    @info "got $(length(nvds)) advisories from NVD"
    euvds = EUVD.fetch_product_matches(vendor, product)
    @info "got $(length(euvds)) advisories from EUVD"
    return nvds, euvds
end

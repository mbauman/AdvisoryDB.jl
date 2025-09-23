module GitHub

using HTTP
using JSON3
using Dates
using DataStructures: OrderedDict as Dict # watch out

using ..SecurityAdvisories: SecurityAdvisories, exists, VersionRange, VersionString, Credit, Reference, Severity, Advisory

const GITHUB_API_BASE = "https://api.github.com"
const DEFAULT_HOURS = 25

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

function create_issue(repo; kwargs...)
    HTTP.post(string(GITHUB_API_BASE, "/repos/", repo, "/issues"), build_headers(),
        sprint(JSON3.write, kwargs))
end

function get_releases(owner, repo)
    response = HTTP.get(string(GITHUB_API_BASE, "/repos/", owner, "/", repo, "/releases"), build_headers())
    if response.status != 200
        error("Failed to fetch advisories: HTTP $(response.status)")
    end

    return JSON3.read(response.body)
end

function parse_link_header(link_header)
    links = Dict{String, String}()

    for link in split(link_header, ",")
        link = strip(link)
        if occursin(";", link)
            url_part, rel_part = split(link, ";", limit=2)
            url = strip(url_part, ['<', '>', ' '])

            rel_match = match(r"rel=\"([^\"]+)\"", rel_part)
            if rel_match !== nothing
                rel = rel_match.captures[1]
                links[rel] = url
            end
        end
    end

    return links
end

function fetch_single_page(url::String, headers::Vector{Pair{String, String}})
    response = HTTP.get(url, headers)

    if response.status != 200
        error("Failed to fetch advisories: HTTP $(response.status)")
    end

    advisories = JSON3.read(response.body)

    # Parse link header for pagination
    next_url = nothing
    link_header = ""

    # Find Link header (case-insensitive)
    for (key, value) in response.headers
        if lowercase(key) == "link"
            link_header = value
            break
        end
    end

    if !isempty(link_header)
        links = parse_link_header(link_header)
        next_url = get(links, "next", nothing)
    end

    return advisories, next_url
end

function fetch_all_pages(base_url::String, headers::Vector{Pair{String, String}})
    all_advisories = []
    current_url = base_url
    page = 1

    while current_url !== nothing
        println("Fetching page $page...")

        advisories, next_url = fetch_single_page(current_url, headers)
        append!(all_advisories, advisories)

        println("Fetched $(length(advisories)) advisories from page $page")

        current_url = next_url
        page += 1
    end

    return all_advisories
end

function fetch_advisories(hours::Int = DEFAULT_HOURS)
    published_since = Dates.now(UTC) - Dates.Hour(hours)
    published_since_str = Dates.format(published_since, "yyyy-mm-ddTHH:MM:SSZ")

    base_url = "$GITHUB_API_BASE/advisories"
    headers = build_headers()

    params = [
        "published" => ">=$published_since_str",
        "per_page" => "100"
    ]

    # Build URL with query parameters
    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    full_url = "$base_url?$query_string"

    println("Fetching advisories published since: $published_since_str")

    all_advisories = fetch_all_pages(full_url, headers)
    println("Fetched $(length(all_advisories)) total advisories across all pages")

    return all_advisories
end

"""
    fetch_ghsa(ghsa)

Fetch a single GitHub advisory. When passed a GHSA id directly, this only searches the canonical advisory database.
There may be other advisories that are only published on a repository and only available that way. Those may be
specified by either the Web URL, API URL, or simply with org/repo/GHSA. For example:

* GHSA-4g68-4pxg-mw93 (but this one would not be found in the database until Julia is blessed)
* https://github.com/JuliaWeb/HTTP.jl/security/advisories/GHSA-4g68-4pxg-mw93
* https://api.github.com/repos/JuliaWeb/HTTP.jl/security-advisories/GHSA-4g68-4pxg-mw93
* JuliaWeb/HTTP.jl/GHSA-4g68-4pxg-mw93
"""
function fetch_ghsa(ghsa)
    startswith(ghsa, "GHSA") && return fetch_database_ghsa(ghsa)
    m = match(r"([^/]+)/([^/]+)/(?:security[/-]advisories/)?(GHSA-\w{4}-\w{4}-\w{4})$", ghsa)
    isnothing(m) && throw(ArgumentError("unknown GHSA identifier $ghsa"))
    owner, repo, id = m.captures
    # I don't fully understand, but this returns 401s with a valid read token:
    return fetch_repo_ghsa(owner, repo, id)
    # And it sometimes seems to be more reliable to filter through all repo advisories:
    # advisories = fetch_repo_advisories("$owner/$repo")
    # return only(filter(x->x.ghsa_id == id, advisories))
end

function vuln_id(vuln, input=nothing)
    (isnothing(input) || startswith(input, "GHSA")) && return vuln.ghsa_id
    m = match(r"([^/]+)/([^/]+)/(?:security[/-]advisories/)?(GHSA-\w{4}-\w{4}-\w{4})$", input)
    owner, repo, id = m.captures
    return "$owner/$repo/$id"
end

function fetch_repo_ghsa(org, repo, ghsa)
    url = "$GITHUB_API_BASE/repos/$org/$repo/security-advisories/$ghsa"
    return fetch_single_page(url, build_headers())[1]
end

function fetch_database_ghsa(ghsa)
    base_url = "$GITHUB_API_BASE/advisories"
    headers = build_headers()

    params = [
        "ghsa_id" => ghsa,
        "per_page" => "100"
    ]

    # Build URL with query parameters
    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    full_url = "$base_url?$query_string"

    all_advisories = fetch_all_pages(full_url, headers)
    println("Fetched $(length(all_advisories)) total advisories across all pages")

    return only(all_advisories)
end

function fetch_repo_advisories(repo::String)
    base_url = "$GITHUB_API_BASE/repos/$repo/security-advisories"
    headers = build_headers()

    params = [
        "per_page" => "100"
    ]

    # Build URL with query parameters
    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    full_url = "$base_url?$query_string"

    println("Fetching advisories from: $repo")

    all_advisories = fetch_all_pages(full_url, headers)
    println("Fetched $(length(all_advisories)) total advisories across all pages")

    return all_advisories
end

function vendor_product_versions(advisory)
    vpv = Tuple{String,String,String}[]
    for v in get(advisory, :vulnerabilities, [])
        exists(v, :package) || continue
        exists(v[:package], :name) || continue
        (exists(v, :vulnerable_version_range) || exists(v, :first_patched_version)) || continue

        # Use Semantic Version numbers if we are in a Julia ecosystem
        T = strip(lowercase(get(v[:package], :ecosystem, ""))) == "julia" ? VersionNumber : VersionString
        # Start with the vulnerable version range (or all versions if it doesn't exist)
        r = something(tryparse(VersionRange{T}, get(v, :vulnerable_version_range, "")), VersionRange{T}("*"))
        # And then if there's patched versions, amend the upper bound to exclude it
        if exists(v, :first_patched_version)
            r = VersionRange{T}(r.lb, T(v[:first_patched_version]), r.lbinclusive, false)
        end
        push!(vpv, (get(v[:package], :ecosystem, ""), v[:package][:name], isnothing(r) ? vulnerable_version_range : string(r)))
    end
    return vpv
end

affected_julia_packages(advisory) = SecurityAdvisories.affected_julia_packages(get(advisory, :description, ""), vendor_product_versions(advisory))

function advisory(vuln)
    affected = affected_julia_packages(vuln)
    upstream_type = Dict("alias"=>:aliases,"upstream"=>:upstream)[get(unique(map(x->x.source_type, affected)), 1, "alias")]

    # Aliases are in multiple places:
    aliases = String[vuln.ghsa_id]
    exists(vuln, :cve_id) && push!(aliases, vuln.cve_id)
    exists(vuln, :identifiers) && append!(aliases, getproperty.(vuln.identifiers, :value))
    unique!(aliases)

    # GitHub stores severities all over the place
    severities = Severity[]
    if exists(vuln, :cvss_severities, :cvss_v3, :vector_string)
        push!(severities, Severity("CVSS_V3", vuln.cvss_severities.cvss_v3.vector_string))
    end
    if exists(vuln, :cvss_severities, :cvss_v4, :vector_string)
        push!(severities, Severity("CVSS_V4", vuln.cvss_severities.cvss_v4.vector_string))
    end
    if exists(vuln, :cvss, :vector_string)
        push!(severities, Severity(vuln.cvss.vector_string))
    end

    # Credits are also messy
    credits = Credit[]
    for c in something(get(vuln, :credits, nothing), [])
        name = something(get(c, :login, nothing), get(get(c, :user, Dict()), :login, nothing), missing)
        ismissing(name) && continue
        contact = get(get(c, :user, Dict()), :html_url, nothing)
        type = get(c, :type)
        push!(credits, Credit(name, contact === nothing ? String[] : [contact], type))
    end

    return Advisory(;
        withdrawn = exists(vuln, :withdrawn_at) ? Dates.now(Dates.UTC) : nothing,
        upstream_type => aliases,
        # related -- nothing structured
        summary = get(vuln, :summary, nothing),
        details = get(vuln, :description, nothing),
        severity = severities,
        affected = affected,
        references = [Reference(url=ref) for ref in something(get(vuln, :references, nothing), [])],
        credits = credits,
        database_specific = Dict{String,Any}("source" => Dict(
            "id" => vuln.ghsa_id,
            "modified" => vuln.updated_at,
            "published" => vuln.published_at,
            "imported" => Dates.now(Dates.UTC),
            "url" => vuln.url,
            "html_url" => vuln.html_url
            )
        )
    )
end


end
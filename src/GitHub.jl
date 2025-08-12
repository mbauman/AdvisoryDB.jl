module GitHub

using HTTP
using JSON3
using Dates
using DataStructures: OrderedDict as Dict # watch out

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
    published_since = now(UTC) - Hour(hours)
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

function fetch_org_advisories(org::String)
    base_url = "$GITHUB_API_BASE/orgs/$org/security-advisories"
    headers = build_headers()

    params = [
        "per_page" => "100"
    ]

    # Build URL with query parameters
    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    full_url = "$base_url?$query_string"

    println("Fetching advisories from: $org")

    all_advisories = fetch_all_pages(full_url, headers)
    println("Fetched $(length(all_advisories)) total advisories across all pages")

    return all_advisories
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

function filter_julia_advisories(advisories)
    julia_advisories = []

    for advisory in advisories
        if haskey(advisory, :vulnerabilities)
            for vuln in advisory.vulnerabilities
                if haskey(vuln, :package) && haskey(vuln.package, :ecosystem)
                    if lowercase(string(vuln.package.ecosystem)) == "julia"
                        push!(julia_advisories, advisory)
                        break
                    end
                end
            end
        end
    end

    return julia_advisories
end

exists(advisory, key) = haskey(advisory, key) && is_populated(getproperty(advisory, key))
exists(advisory, key, keys...) = exists(advisory, key) && exists(advisory, keys...)
is_populated(::Nothing) = false
is_populated(::Missing) = false
is_populated(s::String) = !isempty(strip(s))
is_populated(A::AbstractArray) = !isempty(A)
is_populated(d::AbstractDict) = !isempty(d)

function convert_to_osv(advisory)
    osv = Dict{String, Any}()

    osv["schema_version"] = "1.7.2"
    osv["id"] = advisory.ghsa_id
    osv["modified"] = advisory.updated_at
    if exists(advisory, :published_at)
        osv["published"] = advisory.published_at
    end
    if exists(advisory, :withdrawn_at)
        osv["withdrawn"] = advisory.withdrawn_at
    end
    aliases = []
    if exists(advisory, :cve_id)
        push!(aliases, advisory.cve_id)
    end
    if !isempty(aliases)
        osv["aliases"] = aliases
    end
    # No upstream information is represented in GHSA
    # No structured related information is represented in GHSA
    if exists(advisory, :summary)
        osv["summary"] = advisory.summary
    end
    if exists(advisory, :description)
        osv["details"] = advisory.description
    end
    # GitHub stores severities all over the place
    severities = []
    if exists(advisory, :cvss_severities, :cvss_v3, :vector_string)
        push!(severities, Dict(
            "type" => "CVSS_V3",
            "score" => advisory.cvss_severities.cvss_v3.vector_string
        ))
    end
    if exists(advisory, :cvss_severities, :cvss_v4, :vector_string)
        push!(severities, Dict(
            "type" => "CVSS_V4",
            "score" => advisory.cvss_severities.cvss_v4.vector_string
        ))
    end
    if exists(advisory, :cvss, :vector_string) &&
            !(advisory.cvss.vector_string in getindex.(severities, "score"))
        cvss_ver = match(r"^CVSS:([34])", vs)
        isnothing(cvss_ver) && error("Unknown CVSS vector string: $(advisory.cvss.vector_string) in $(advisory.ghsa_id)")
        push!(severities, Dict(
            "type" => "CVSS_V$cvss_ver",
            "score" => advisory.cvss.vector_string
        ))
    end
    if !isempty(severities)
        osv["severity"] = severities
    end
    # The OSV affected field is the trickiest one
    affected = []
    if exists(advisory, :vulnerabilities)
        for vuln in advisory.vulnerabilities
            exists(vuln, :package) || continue
            (exists(vuln.package, :ecosystem) && exists(vuln.package, :name)) || error("a vulnerability in $(advisory.ghsa_id) does not have required ecosystem and name fields")
            lowercase(vuln.package.ecosystem) == "julia" || continue
            package = Dict{String, Any}()
            package["ecosystem"] = "Julia"
            package["name"] = chopsuffix(vuln.package.name, ".jl")
            # package["purl"] # TODO (this is optional)
            # GHSA does not have independent severity scores per affected package
            # Versions are not easy in general. From OSV-Schema's convert_ghsa.py:
            #   GHSA range format is described at:
            #   https://docs.github.com/en/graphql/reference/objects#securityvulnerability
            #   "= 0.2.0" denotes a single vulnerable version.
            #   "<= 1.0.8" denotes a version range up to and including the specified version
            #   "< 0.1.11" denotes a version range up to, but excluding, the specified version
            #   ">= 4.3.0, < 4.3.5" denotes a version range with a known minimum and maximum version.
            #   ">= 0.0.1" denotes a version range with a known minimum, but no known maximum.
            #   (Undocumented) ">" is also a valid operator.
            versions = String[]
            range_events = Dict{String, String}[]
            for ghsa_range in (strip(r) for r in eachsplit(vuln.vulnerable_version_range, ","))
                if startswith(ghsa_range, "= ")
                    push!(versions, chopprefix(ghsa_range, "= "))
                elseif startswith(ghsa_range, "<= ")
                    push!(range_events, Dict("last_affected" => chopprefix(ghsa_range, "<= ")))
                elseif startswith(ghsa_range, "< ")
                    push!(range_events, Dict("limit" => chopprefix(ghsa_range, "< ")))
                elseif startswith(ghsa_range, ">= ")
                    push!(range_events, Dict("introduced" => chopprefix(ghsa_range, ">= ")))
                elseif startswith(ghsa_range, "> ")
                    error("a vulnerability in $(advisory.ghsa_id) uses the undocumented > range syntax")
                else
                    error("a vulnerability in $(advisory.ghsa_id) uses an unsupported vulnerable range syntax")
                end
            end
            if isempty(versions) && isempty(range_events)
                push!(range_events, Dict("introduced" => "0"))
            end
            if exists(vuln, :patched_versions)
                for patched_ver in (strip(r) for r in eachsplit(vuln.patched_versions, ","))
                    push!(range_events, Dict("fixed" => chopprefix("= ", patched_ver)))
                end
            end
            affected_entry = Dict()
            affected_entry["package"] = package
            if !isempty(versions)
                affected_entry["versions"] = versions
            end
            if !isempty(range_events)
                affected_entry["ranges"] = [Dict("type"=>"SEMVER", "events"=>range_events)]
            end
            push!(affected, affected_entry)
        end
    end
    if !isempty(affected)
        osv["affected"] = affected
    end

    references = []
    if haskey(advisory, :html_url)
        push!(references, Dict(
            "type" => "ADVISORY",
            "url" => advisory.html_url
        ))
    end
    if !isempty(references)
        osv["references"] = references
    end

    db = Dict()
    if exists(advisory, :cwe_ids)
        db["cwe_ids"] = collect(advisory.cwe_ids)
    end
    if exists(advisory, :severity)
        db["severity"] = advisory.severity
    end
    if exists(advisory, :state)
        db["state"] = advisory.state
    end
    if !isempty(db)
        osv["database_specific"] = db
    end
    return osv
end


end
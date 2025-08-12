module GitHub

using HTTP
using JSON3
using Dates
using TOML: TOML

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

    println("Found $(length(julia_advisories)) Julia ecosystem advisories")
    return julia_advisories
end

end
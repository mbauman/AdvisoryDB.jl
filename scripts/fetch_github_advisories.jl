#!/usr/bin/env julia

using HTTP
using JSON3
using YAML
using Dates

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

function create_issue(;kargs...)
    HTTP.post(string(GITHUB_API_BASE, "/repos/", ENV["GITHUB_REPOSITORY"], "/issues"), build_headers(),
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

function convert_to_osv(advisory)
    osv = Dict{String, Any}()

    osv["schema_version"] = "1.6.0"
    osv["id"] = advisory.ghsa_id
    osv["modified"] = advisory.updated_at

    if haskey(advisory, :published_at)
        osv["published"] = advisory.published_at
    end

    if haskey(advisory, :summary)
        osv["summary"] = advisory.summary
    end

    if haskey(advisory, :description)
        osv["details"] = advisory.description
    end

    aliases = []
    if haskey(advisory, :cve_id) && advisory.cve_id !== nothing
        push!(aliases, advisory.cve_id)
    end
    if !isempty(aliases)
        osv["aliases"] = aliases
    end

    if haskey(advisory, :severity)
        osv["severity"] = [Dict(
            "type" => "CVSS_V3",
            "score" => advisory.severity
        )]
    end

    if haskey(advisory, :vulnerabilities)
        affected = []
        for vuln in advisory.vulnerabilities
            if haskey(vuln, :package)
                affected_entry = Dict{String, Any}()
                affected_entry["package"] = Dict(
                    "ecosystem" => vuln.package.ecosystem,
                    "name" => vuln.package.name
                )

                if haskey(vuln, :vulnerable_version_range)
                    affected_entry["ranges"] = [Dict(
                        "type" => "ECOSYSTEM",
                        "events" => [Dict(
                            "introduced" => "0",
                            "fixed" => vuln.vulnerable_version_range
                        )]
                    )]
                end

                push!(affected, affected_entry)
            end
        end
        if !isempty(affected)
            osv["affected"] = affected
        end
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

    return osv
end

function get_packages(advisory)
    pkgs = Tuple{String,String}[]
    General = only(filter(x->x.uuid==Base.UUID("23338594-aafe-5451-b93e-139f81909106"), Pkg.Registry.reachable_registries()))
    if haskey(advisory, :vulnerabilities) && !isempty(advisory.vulnerabilities)
        for vuln in advisory.vulnerabilities
            lowercase(string(vuln.package.ecosystem)) == "julia" || continue
            if haskey(vuln, :package) && haskey(vuln.package, :name)
                pkgname = chopsuffix(strip(vuln.package.name), ".jl")
                uuids = Pkg.Registry.uuids_from_name(General, pkgname)
                if length(uuids) != 1
                    url = haskey(advisory, :html_url) ? advisory.html_url : ""
                    create_issue(
                        title="Failed to find a registered $(pkgname) for $(advisory.ghsa_id)",
                        body="""
                            The advisory [$(advisory.ghsa_id)]($url) names **$pkgname** as an affected product from
                            the Julia ecosystem, but $(isempty(uuids) ? "no" : "more than one") match was found
                            in the General registry.

                            The complete advisory is:

                            ```json
                            $(sprint(JSON3.write, advisory))
                            ```
                            """
                    )
                else
                    push!(pkgs, (pkgname, only(uuids)))
                end
            end
        end
    end
    return pkgs
end

function write_advisory_files(advisories)
    packages_dir = "packages"

    for advisory in advisories
        osv_data = convert_to_osv(advisory)
        for (package, uuid) in get_packages(advisory)
            package_dir = joinpath(packages_dir, package, uuid)
            if !isdir(package_dir)
                mkpath(package_dir)
            end

            filename = "$(advisory.ghsa_id).yml"
            filepath = joinpath(package_dir, filename)

            println("Writing advisory: $filepath")
            YAML.write_file(filepath, osv_data)

        end
    end

    println("Completed writing $(length(advisories)) advisories to disk")
end

function main()
    try
        println("Starting GitHub Security Advisory fetcher...")
        if !isempty(ARGS) && !isempty(ARGS[1])
            # Fetch all advisories for a single repo (for manual triggering)
            advisories = fetch_repo_advisories(ARGS[1])
        else
            all_advisories = fetch_advisories()
            advisories = filter_julia_advisories(all_advisories)
        end

        if isempty(advisories)
            println("No Julia ecosystem advisories found in the specified time period.")
            return
        end

        write_advisory_files(advisories)
        println("Process completed successfully!")

    catch e
        println("Error: $e")
        exit(1)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

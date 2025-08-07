module NVD

using HTTP
using JSON3
using YAML
using Dates

const NVD_API_BASE = "https://services.nvd.nist.gov/rest/json/cves/2.0"
const DEFAULT_HOURS = 25

function build_nvd_headers()
    headers = [
        "Accept" => "application/json",
        "User-Agent" => "Julia-NVD-Fetcher/1.0"
    ]

    if haskey(ENV, "NVD_API_KEY")
        push!(headers, "apiKey" => ENV["NVD_API_KEY"])
    end

    return headers
end

function fetch_nvd_page(url::String, headers::Vector{Pair{String, String}})
    println("Fetching: $url")

    # Sleep for rate limiting (6 seconds recommended by NVD)
    sleep(6)

    response = HTTP.get(url, headers)

    if response.status != 200
        error("Failed to fetch NVD data: HTTP $(response.status)")
    end

    data = JSON3.read(response.body)
    return data
end

function fetch_nvd_vulnerabilities(hours::Int = DEFAULT_HOURS)
    # Calculate time range
    end_time = now(UTC)
    start_time = end_time - Hour(hours)

    # Format dates for NVD API (ISO 8601)
    start_date = Dates.format(start_time, "yyyy-mm-ddTHH:MM:SS.sssZ")
    end_date = Dates.format(end_time, "yyyy-mm-ddTHH:MM:SS.sssZ")

    headers = build_nvd_headers()
    all_vulnerabilities = []

    # Build initial URL with parameters
    params = [
        "lastModStartDate" => start_date,
        "lastModEndDate" => end_date,
        "resultsPerPage" => "2000",
        "startIndex" => "0"
    ]

    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    url = "$NVD_API_BASE?$query_string"

    println("Fetching NVD vulnerabilities modified between $start_date and $end_date")

    # Fetch first page
    data = fetch_nvd_page(url, headers)

    if haskey(data, :vulnerabilities)
        append!(all_vulnerabilities, data.vulnerabilities)
        println("Fetched $(length(data.vulnerabilities)) vulnerabilities from first page")

        # Check if there are more results
        total_results = data.totalResults
        results_per_page = data.resultsPerPage
        start_index = data.startIndex

        println("Total results available: $total_results")

        # Fetch remaining pages if needed
        while start_index + results_per_page < total_results
            start_index += results_per_page

            # Update startIndex parameter
            new_params = [
                "lastModStartDate" => start_date,
                "lastModEndDate" => end_date,
                "resultsPerPage" => "2000",
                "startIndex" => string(start_index)
            ]

            query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in new_params], "&")
            next_url = "$NVD_API_BASE?$query_string"

            data = fetch_nvd_page(next_url, headers)

            if haskey(data, :vulnerabilities)
                append!(all_vulnerabilities, data.vulnerabilities)
                println("Fetched $(length(data.vulnerabilities)) vulnerabilities from page at index $start_index")
            end
        end
    end

    println("Total NVD vulnerabilities fetched: $(length(all_vulnerabilities))")
    return all_vulnerabilities
end

function filter_julia_vulnerabilities(vulnerabilities)
    julia_vulnerabilities = []

    for vuln in vulnerabilities
        if haskey(vuln, :cve) && haskey(vuln.cve, :configurations)
            # Look for Julia-related CPE entries or descriptions
            is_julia_related = false

            # Check configurations for Julia CPE entries
            for config in vuln.cve.configurations
                if haskey(config, :nodes)
                    for node in config.nodes
                        if haskey(node, :cpeMatch)
                            for cpe_match in node.cpeMatch
                                if haskey(cpe_match, :criteria)
                                    criteria = lowercase(string(cpe_match.criteria))
                                    if occursin("julia", criteria) || occursin("julialang", criteria)
                                        is_julia_related = true
                                        break
                                    end
                                end
                            end
                        end
                        if is_julia_related
                            break
                        end
                    end
                end
                if is_julia_related
                    break
                end
            end

            # Also check descriptions for Julia mentions
            if !is_julia_related && haskey(vuln.cve, :descriptions)
                for desc in vuln.cve.descriptions
                    if haskey(desc, :value)
                        desc_text = lowercase(string(desc.value))
                        if occursin("julia", desc_text) && (occursin("package", desc_text) || occursin("library", desc_text))
                            is_julia_related = true
                            break
                        end
                    end
                end
            end

            if is_julia_related
                push!(julia_vulnerabilities, vuln)
            end
        end
    end

    println("Found $(length(julia_vulnerabilities)) Julia-related vulnerabilities")
    return julia_vulnerabilities
end

function convert_nvd_to_osv(vuln)
    osv = Dict{String, Any}()

    # Required OSV fields
    osv["schema_version"] = "1.6.0"
    osv["id"] = vuln.cve.id
    osv["modified"] = vuln.cve.lastModified

    # Optional fields
    if haskey(vuln.cve, :published)
        osv["published"] = vuln.cve.published
    end

    # Summary and details from descriptions
    if haskey(vuln.cve, :descriptions)
        for desc in vuln.cve.descriptions
            if haskey(desc, :lang) && desc.lang == "en" && haskey(desc, :value)
                description = desc.value
                # Use first sentence as summary, full text as details
                if length(description) > 100
                    summary_end = findfirst(". ", description)
                    if summary_end !== nothing
                        osv["summary"] = description[1:summary_end[1]]
                        osv["details"] = description
                    else
                        osv["summary"] = description[1:min(100, length(description))] * "..."
                        osv["details"] = description
                    end
                else
                    osv["summary"] = description
                    osv["details"] = description
                end
                break
            end
        end
    end

    # CVSS severity information
    if haskey(vuln.cve, :metrics)
        severity_info = []

        # Check for CVSS v3.x metrics
        for (version, metrics) in pairs(vuln.cve.metrics)
            if occursin("cvssMetric", string(version))
                for metric in metrics
                    if haskey(metric, :cvssData)
                        push!(severity_info, Dict(
                            "type" => "CVSS_V3",
                            "score" => string(metric.cvssData.baseScore)
                        ))
                        break
                    end
                end
            end
        end

        if !isempty(severity_info)
            osv["severity"] = severity_info
        end
    end

    # Affected packages (extracted from CPE data)
    affected = []
    if haskey(vuln.cve, :configurations)
        for config in vuln.cve.configurations
            if haskey(config, :nodes)
                for node in config.nodes
                    if haskey(node, :cpeMatch)
                        for cpe_match in node.cpeMatch
                            if haskey(cpe_match, :criteria)
                                criteria = cpe_match.criteria
                                if occursin("julia", lowercase(criteria))
                                    # Parse CPE format: cpe:2.3:a:vendor:product:version:...
                                    cpe_parts = split(criteria, ":")
                                    if length(cpe_parts) >= 6
                                        vendor = cpe_parts[4]
                                        product = cpe_parts[5]
                                        version = cpe_parts[6]

                                        affected_entry = Dict{String, Any}()
                                        affected_entry["package"] = Dict(
                                            "ecosystem" => "Julia",
                                            "name" => product
                                        )

                                        if version != "*"
                                            affected_entry["ranges"] = [Dict(
                                                "type" => "ECOSYSTEM",
                                                "events" => [Dict(
                                                    "introduced" => "0",
                                                    "fixed" => version
                                                )]
                                            )]
                                        end

                                        push!(affected, affected_entry)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if !isempty(affected)
        osv["affected"] = affected
    end

    # References
    references = []
    if haskey(vuln.cve, :references)
        for ref in vuln.cve.references
            if haskey(ref, :url)
                push!(references, Dict(
                    "type" => "WEB",
                    "url" => ref.url
                ))
            end
        end
    end

    if !isempty(references)
        osv["references"] = references
    end

    return osv
end

function get_first_package_name_nvd(vuln)
    # Extract package name from CPE data or fallback to CVE ID
    if haskey(vuln.cve, :configurations)
        for config in vuln.cve.configurations
            if haskey(config, :nodes)
                for node in config.nodes
                    if haskey(node, :cpeMatch)
                        for cpe_match in node.cpeMatch
                            if haskey(cpe_match, :criteria)
                                criteria = cpe_match.criteria
                                if occursin("julia", lowercase(criteria))
                                    cpe_parts = split(criteria, ":")
                                    if length(cpe_parts) >= 6
                                        return cpe_parts[5]  # product name
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    # Fallback to using CVE ID as package name
    return replace(vuln.cve.id, "CVE-" => "cve_")
end

function write_nvd_advisory_files(vulnerabilities)
    packages_dir = "packages"

    if !isdir(packages_dir)
        mkdir(packages_dir)
    end

    for vuln in vulnerabilities
        osv_data = convert_nvd_to_osv(vuln)
        package_name = get_first_package_name_nvd(vuln)

        package_dir = joinpath(packages_dir, package_name)
        if !isdir(package_dir)
            mkdir(package_dir)
        end

        filename = "$(vuln.cve.id).yml"
        filepath = joinpath(package_dir, filename)

        println("Writing NVD advisory: $filepath")
        YAML.write_file(filepath, osv_data)
    end

    println("Completed writing $(length(vulnerabilities)) NVD advisories to disk")
end

function main()
    try
        println("Starting NVD vulnerability fetcher...")

        all_vulnerabilities = fetch_nvd_vulnerabilities(200)
        julia_vulnerabilities = filter_julia_vulnerabilities(all_vulnerabilities)

        if isempty(julia_vulnerabilities)
            println("No Julia-related vulnerabilities found in the specified time period.")
            return
        end

        write_nvd_advisory_files(julia_vulnerabilities)
        println("NVD process completed successfully!")

    catch e
        println("Error: $e")
        exit(1)
    end
end

end
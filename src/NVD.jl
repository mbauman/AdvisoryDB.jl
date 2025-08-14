module NVD

using HTTP
using JSON3
using Dates
using TOML: TOML
using DataStructures: OrderedDict as Dict # watch out

using ..AdvisoryDB: exists

const NVD_API_BASE = "https://services.nvd.nist.gov/rest/json/cves/2.0"
const NVD_CPE_API_BASE = "https://services.nvd.nist.gov/rest/json/cpes/2.0"
const DEFAULT_HOURS = 25

struct CPE
    # "cpe:2.3:"
    part::String
    vendor::String
    product::String
    version::String
    update::String
    edition::String
    language::String
    sw_edition::String
    target_sw::String
    target_hw::String
    other::String
    function cpe_by_parts(cpe="cpe", ver="2.3", part="*", vendor="*", product="*", version="*", update="*", edition="*", language="*", sw_edition="*", target_sw="*", target_hw="*", other="*")
        cpe == "cpe" || throw(ArgumentError("Invalid CPE string starting with $cpe"))
        ver in ("2.3","*") || throw(ArgumentError("Unsupported CPE version $ver"))
        part in ("a","h","o","*") || throw(ArgumentError("Unsupported part identifier $part"))
        return new(part, vendor, product, version, update, edition, language, sw_edition, target_sw, target_hw, other)
    end
    CPE(s::AbstractString) = cpe_by_parts(split(s, ':'; keepempty=false)...)
end
Base.Broadcast.broadcastable(cpe::CPE) = Ref(cpe)
parts(cpe::CPE) = getproperty.(cpe, fieldnames(CPE))
Base.string(cpe::CPE) = string("cpe:2.3:", join(parts(cpe), ":"))
Base.convert(::Type{CPE}, s::String) = CPE(s)
Base.convert(::Type{String}, cpe::CPE) = string(cpe)
Base.show(io::IO, cpe::CPE) = show(io, string(cpe))
globequal(a, b) = a == "*" || b == "*" || lowercase(a) == lowercase(b)
matches(a::CPE, b::CPE) = all(Base.splat(globequal), zip(parts(a), parts(b)))
matches(a::CPE) = Base.Fix1(matches, a)

ignoreglobequal(a, b) = a != "*" && b != "*" && a == b
matchcount(a::CPE, b::CPE) = sum(Base.splat(ignoreglobequal), zip(parts(a), parts(b)))

hasmatchingkey(dict::AbstractDict{CPE}, cpe::Nothing) = false
hasmatchingkey(dict::AbstractDict{CPE}, cpe::CPE) = any(matches(cpe), keys(dict))
function getmostspecific(dict::AbstractDict{CPE}, cpe::CPE)
    candidates = filter(matches(cpe), keys(dict))
    length(candidates) == 1 && return dict[only(candidates)]
    return dict[argmax(x->NVD.matchcount(cpe, x), keys(dict))]
end

const CPE_MAP = Dict{CPE,String}(CPE(k) => v for (k,v) in TOML.parsefile(joinpath(@__DIR__, "..", "cpe_equivalents.toml")))

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

function fetch_all_pages(base_url, headers, params, key)
    haskey(params, "resultsPerPage") || (params["resultsPerPage"] = "2000")
    haskey(params, "startIndex")     || (params["startIndex"]     = "0")
    # Fetch first page
    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    first_url = "$base_url?$query_string"
    data = fetch_nvd_page(first_url, headers)
    all_data = []
    if haskey(data, key)
        append!(all_data, getproperty(data, key))
        println("Fetched $(length(getproperty(data, key))) vulnerabilities from first page")

        # Check if there are more results
        total_results = data.totalResults
        results_per_page = data.resultsPerPage
        start_index = data.startIndex

        println("Total results available: $total_results")

        # Fetch remaining pages if needed
        while start_index + results_per_page < total_results
            start_index += results_per_page

            # Update startIndex parameter
            new_params = copy(params)
            new_params["startIndex"] = string(parse(Int, params["startIndex"]) + parse(Int, params["resultsPerPage"]))

            query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in new_params], "&")
            next_url = "$base_url?$query_string"

            data = fetch_nvd_page(next_url, headers)

            if haskey(data, key)
                append!(all_data, getproperty(data, key))
                println("Fetched $(length(getproperty(data, key))) vulnerabilities from page at index $start_index")
            end
        end
    end

    println("Total NVD vulnerabilities fetched: $(length(all_data))")
    return all_data
end

function fetch_cve(cveId)
    headers = build_nvd_headers()

    # Build initial URL with parameters
    params = Dict(
        "cveId" => cveId,
        "resultsPerPage" => "2000",
        "startIndex" => "0"
    )

    return fetch_all_pages(NVD_API_BASE, headers, params, :vulnerabilities)
end

function fetch_cpe_matches(cpe)
    headers = build_nvd_headers()

    # Build initial URL with parameters
    params = Dict(
        "cpeMatchString" => string(cpe),
        "resultsPerPage" => "2000",
        "startIndex" => "0"
    )

    return fetch_all_pages(NVD_CPE_API_BASE, headers, params, :products)
end

function fetch_nvd_vulnerabilities(hours::Int = DEFAULT_HOURS)
    # Calculate time range
    end_time = now(UTC)
    start_time = end_time - Hour(hours)

    # Format dates for NVD API (ISO 8601)
    start_date = Dates.format(start_time, "yyyy-mm-ddTHH:MM:SS.sssZ")
    end_date = Dates.format(end_time, "yyyy-mm-ddTHH:MM:SS.sssZ")

    headers = build_nvd_headers()

    # Build initial URL with parameters
    params = Dict(
        "lastModStartDate" => start_date,
        "lastModEndDate" => end_date,
        "resultsPerPage" => "2000",
        "startIndex" => "0"
    )

    return fetch_all_pages(NVD_API_BASE, headers, params, :vulnerabilities)
end

function filter_julia_vulnerabilities(vulnerabilities)
    julia_vulnerabilities = []

    for vuln in vulnerabilities
        if exists(vuln, :cve) && exists(vuln.cve, :configurations)
            # Look for Julia-related CPE entries or descriptions
            is_julia_related = false

            # Check configurations for upstream CPE entries
            for config in vuln.cve.configurations
                if exists(config, :nodes)
                    for node in config.nodes
                        if exists(node, :cpeMatch)
                            for cpe_match in node.cpeMatch
                                if exists(cpe_match, :criteria)
                                    if hasmatchingkey(CPE_MAP, CPE(cpe_match.criteria))
                                        is_julia_related = true
                                        break
                                    end
                                end
                            end
                        end
                        is_julia_related && break
                    end
                end
                is_julia_related && break
            end
            if is_julia_related
                push!(julia_vulnerabilities, vuln)
            end
        end
    end

    return julia_vulnerabilities
end

function convert_to_osv(vuln)
    osv = Dict{String, Any}()

    # Required OSV fields
    osv["schema_version"] = "1.7.2"
    osv["id"] = vuln.cve.id
    osv["modified"] = vuln.cve.lastModified * "Z"

    # Optional fields
    if exists(vuln.cve, :published)
        osv["published"] = vuln.cve.published * "Z"
    end
    # No withdrawn information?
    # No structured aliases. Could potentially search through references, but it's messy
    # No upstream information
    # No related tags (beyond references)

    # Summary and details from descriptions, using English only
    if exists(vuln.cve, :descriptions)
        for desc in vuln.cve.descriptions
            if exists(desc, :lang) && desc.lang == "en" && exists(desc, :value)
                description = desc.value
                flat_description = replace(description, r"\s+"=>" ")
                # Use first sentence as summary, full text as details
                if length(flat_description) > 100
                    summary_end = findfirst(". ", flat_description)
                    if summary_end !== nothing
                        osv["summary"] = flat_description[1:summary_end[1]]
                        osv["details"] = description
                    else
                        osv["summary"] = flat_description[1:min(100, length(description))] * "..."
                        osv["details"] = description
                    end
                else
                    osv["summary"] = flat_description
                    osv["details"] = description
                end
                break
            end
        end
    end

    # CVSS severity information
    if exists(vuln.cve, :metrics)
        severity_info = []

        # Check for CVSS metrics
        for (version, metrics) in pairs(vuln.cve.metrics)
            v = match(r"^cvssMetricV([234])", string(version))
            if !isnothing(v)
                for metric in metrics
                    if exists(metric, :cvssData)
                        push!(severity_info, Dict(
                            "type" => "CVSS_V"*v[1],
                            "score" => string(metric.cvssData.vectorString)
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

    # Affected _Julia_ packages, connecting CPE data to the package
    affected = []
    if exists(vuln.cve, :configurations)
        for config in vuln.cve.configurations
            exists(config, :nodes) || continue
            for node in config.nodes
                exists(node, :cpeMatch) || continue
                matches = filter(m->exists(m, :criteria) && hasmatchingkey(CPE_MAP, CPE(m.criteria)), node.cpeMatch)
                isempty(matches) && continue
                exists(node, :negate) && node.negate && error("I don't know how to handle negated version ranges")
                exists(node, :operator) && node.operator == "AND" && length(matches) > 1 && error("I don't know how to combine multiple AND nodes")
                packages = unique(split(getmostspecific(CPE_MAP, CPE(k.criteria)), '@', limit=2)[1] for k in matches)
                length(packages) == 1 || error("I don't know how to handle multiple packages in the same configuration node")
                package = only(packages)
                affected_entry = Dict{String, Any}()
                affected_entry["package"] = Dict(
                    "ecosystem" => "Julia",
                    "name" => package
                )

                # Now the hard part: the version ranges.
                events = []
                if !exists(first(matches), :versionStartIncluding)
                    push!(events, Dict("introduced" => "0"))
                end
                for m in matches
                    (!exists(m, :vulnerable) || !m.vulnerable) && continue
                    if exists(m, :versionStartIncluding)
                        push!(events, Dict("introduced" => m.versionStartIncluding))
                    end
                    if exists(m, :versionEndExcluding)
                        push!(events, Dict("fixed" => m.versionEndExcluding))
                    end
                end
                affected_entry["ranges"] = Dict("type"=>"SEMVER", "events"=>events)
                push!(affected, affected_entry)
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

    # No structured credits
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
        osv_data = convert_to_osv(vuln)
        package_name = get_first_package_name_nvd(vuln)

        package_dir = joinpath(packages_dir, package_name)
        if !isdir(package_dir)
            mkdir(package_dir)
        end

        filename = "$(vuln.cve.id).json"
        filepath = joinpath(package_dir, filename)

        println("Writing NVD advisory: $filepath")
        JSON3.pretty(filepath, osv_data)
    end

    println("Completed writing $(length(vulnerabilities)) NVD advisories to disk")
end

end
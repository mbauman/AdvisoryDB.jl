module NVD

using HTTP
using JSON3
using Dates
using TOML: TOML
using DataStructures: OrderedDict as Dict # watch out

using ..AdvisoryDB: AdvisoryDB, exists

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
vendorproduct(a::CPE) = (a.vendor, a.product)
function cpeversion(a::CPE)
    a.version == "*" && return missing
    update = a.update == "*" ? "" : a.update == "-" ? "-" : string("-", a.update)
    rest = string(
        a.edition == "*" ? "" : a.edition,
        a.language == "*" ? "" : a.language,
        a.sw_edition == "*" ? "" : a.sw_edition,
        a.target_sw == "*" ? "" : a.target_sw,
        a.target_hw == "*" ? "" : a.target_hw,
        a.other == "*" ? "" : a.other,)
    return string(a.version, update, isempty(rest) ? "" : string("+", rest))
end

ignoreglobequal(a, b) = a != "*" && b != "*" && a == b
matchcount(a::CPE, b::CPE) = sum(Base.splat(ignoreglobequal), zip(parts(a), parts(b)))

hasmatchingkey(dict::AbstractDict{CPE}, cpe::Nothing) = false
hasmatchingkey(dict::AbstractDict{CPE}, cpe::CPE) = any(matches(cpe), keys(dict))
function getmostspecific(dict::AbstractDict{CPE}, cpe::CPE)
    candidates = filter(matches(cpe), keys(dict))
    length(candidates) == 1 && return dict[only(candidates)]
    return dict[argmax(x->NVD.matchcount(cpe, x), keys(dict))]
end

const CPE_MAP = Dict{CPE,String}() # CPE(k) => v for (k,v) in TOML.parsefile(joinpath(@__DIR__, "..", "cpe_equivalents.toml")))

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
        println("Fetched $(length(getproperty(data, key))) results from first page")

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

            # Sleep for rate limiting (6 seconds recommended by NVD)
            sleep(6)
            data = fetch_nvd_page(next_url, headers)

            if haskey(data, key)
                append!(all_data, getproperty(data, key))
                println("Fetched $(length(getproperty(data, key))) results from page at index $start_index")
            end
        end
    end

    println("Total results fetched: $(length(all_data))")
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

    return only(fetch_all_pages(NVD_API_BASE, headers, params, :vulnerabilities))
end

function fetch_cpe_matches(cpe)
    headers = build_nvd_headers()

    # Build initial URL with parameters
    params = Dict(
        "virtualMatchString" => string(cpe),
        "resultsPerPage" => "2000",
        "startIndex" => "0"
    )

    return fetch_all_pages(NVD_API_BASE, headers, params, :vulnerabilities)
end

function fetch_cpes(cpe)
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

function vendor_product_versions(vuln)
    vpvs = Tuple{String,String,String}[]
    (exists(vuln, :cve) && exists(vuln.cve, :configurations)) || return vpvs
    for config in vuln.cve.configurations
        exists(config, :nodes) || continue
        for node in config.nodes
            exists(node, :children) && error("don't know what to do here")
            exists(node, :cpeMatch) || continue
            negate = get(node, :negate, false)
            for cpe_match in node.cpeMatch
                exists(cpe_match, :criteria) || continue
                vulnerable = get(cpe_match, :vulnerable, true) ⊻ negate
                vulnerable || continue
                cpe = CPE(cpe_match.criteria)
                vp = vendorproduct(cpe)
                ver = cpeversion(cpe)
                if !ismissing(ver)
                    # We have an exact version number embedded into the CPE
                    push!(vpvs, (vp..., "= $ver"))
                    continue
                end
                lb = if exists(cpe_match, :versionStartIncluding)
                    string(">= ", cpe_match.versionStartIncluding)
                elseif exists(cpe_match, :versionStartExcluding)
                    string("> ", cpe_match.versionStartExcluding)
                else missing end
                ub = if exists(cpe_match, :versionEndIncluding)
                    string("<= ", cpe_match.versionEndIncluding)
                elseif exists(cpe_match, :versionEndExcluding)
                    string("< ", cpe_match.versionEndExcluding)
                else missing end
                version = join(skipmissing([lb,ub]), ", ")

                push!(vpvs, (vp..., version))
            end
        end
    end
    return unique!(vpvs)
end

related_julia_packages(vuln) = AdvisoryDB.related_julia_packages(english_description(vuln), vendor_product_versions(vuln))

function filter_julia_vulnerabilities(vulnerabilities)
    julia_vulnerabilities = []

    for vuln in vulnerabilities
        if !isempty(related_julia_packages(vuln))
            push!(julia_vulnerabilities, vuln)
        end
    end

    return julia_vulnerabilities
end

function english_description(vuln)
    if exists(vuln, :cve) && exists(vuln.cve, :descriptions)
        for desc in vuln.cve.descriptions
            if exists(desc, :lang) && desc.lang == "en" && exists(desc, :value)
                return string(desc.value)
            end
        end
    end
    return ""
end

function version_string(node)
    # Output a GHSA-like version string for a given configuration node

end

function convert_to_osv(vuln, package_versioninfo = nothing)
    osv = Dict{String, Any}()

    # Required OSV fields
    osv["schema_version"] = "1.7.2"
    osv["id"] = "DONOTUSEJLSEC-0000"
    osv["published"] = AdvisoryDB.now()
    osv["modified"] = AdvisoryDB.now()

    # NVD does not include withdrawn information

    # The vuln id _either_ becomes an alias **or** an upstream advisory.
    # NVD does not provide its own structured alias/upstream info.
    # TODO: I think some vulns may be slightly better described as "upstream", but it's not obvious to me
    osv["aliases"] = [vuln.cve.id]

    # No related tags (beyond references)

    # Summary and details from descriptions, using English only
    description = english_description(vuln)
    if !isempty(description)
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

    # Affected _Julia_ packages, either explicitly passed
    package_versioninfos = isnothing(package_versioninfo) ? related_julia_packages(vuln) : [package_versioninfo]
    affected = []
    for (package, versioninfo) in package_versioninfos
        affected_entry = Dict{String, Any}()
        affected_entry["package"] = Dict(
            "ecosystem" => "Julia",
            "name" => package
        )
        range_events = AdvisoryDB.osv_events(AdvisoryDB.VersionRange{VersionNumber}.(versioninfo))
        affected_entry["ranges"] = [Dict("type"=>"SEMVER", "events"=>range_events)]
        push!(affected, affected_entry)
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
        open(filepath, "w") do f
            JSON3.pretty(f, osv_data)
        end
    end

    println("Completed writing $(length(vulnerabilities)) NVD advisories to disk")
end

end
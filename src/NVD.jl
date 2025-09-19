module NVD

using HTTP
using JSON3
using Dates
using TOML: TOML
using DataStructures: OrderedDict as Dict # watch out

using ..AdvisoryDB: AdvisoryDB, exists, Severity, Advisory, Reference, Credit, extract_summary

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
    start_date = Dates.format(start_time, "yyyy-mm-ddTHH:MM:SS.sss")*"Z"
    end_date = Dates.format(end_time, "yyyy-mm-ddTHH:MM:SS.sss")*"Z"

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

affected_julia_packages(vuln) = AdvisoryDB.affected_julia_packages(english_description(vuln), vendor_product_versions(vuln))

function filter_julia_vulnerabilities(vulnerabilities)
    julia_vulnerabilities = []

    for vuln in vulnerabilities
        if !isempty(affected_julia_packages(vuln))
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

function advisory(vuln)
    affected = affected_julia_packages(vuln)
    upstream_type = Dict("alias"=>:aliases,"upstream"=>:upstream)[get(unique(map(x->x.source_type, affected)), 1, "alias")]

    # Severities are a little complicated
    severities = Severity[]
    for (version, metrics) in pairs(get(vuln.cve, :metrics, Dict()))
        v = match(r"^cvssMetricV([234])", string(version))
        isnothing(v) && continue
        for metric in metrics
            exists(metric, :cvssData, :vectorString) || continue
            push!(severities, Severity(
                type = "CVSS_V"*v[1],
                score = string(metric.cvssData.vectorString)
            ))
            break # We'll just find the first such metric; there may be more
        end
    end

    return Advisory(;
        withdrawn = if lowercase(get(vuln.cve, :vulnStatus, "")) == "rejected"
            vuln.cve.lastModified * "Z" # There's no specific withdrawn date; use the last modified as a proxy
        end,
        upstream_type => String[vuln.cve.id],
        # related -- nothing structured
        summary = extract_summary(english_description(vuln)),
        details = english_description(vuln),
        severity = severities,
        affected = affected,
        references = [Reference(url=ref.url) for ref in get(vuln.cve, :references, []) if haskey(ref, :url)],
        # credits -- not structured
        database_specific = Dict{String,Any}("source" => Dict(
            "id" => vuln.cve.id,
            "modified" => vuln.cve.lastModified * "Z",
            "published" => vuln.cve.published * "Z",
            "imported" => AdvisoryDB.now(),
            "url" => string(NVD_API_BASE, "?cveId=", vuln.cve.id),
            "html_url" => string("https://nvd.nist.gov/vuln/detail/", vuln.cve.id)
            )
        )
    )
end

end
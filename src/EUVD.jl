module EUVD

using HTTP
using JSON3
using Dates: Dates, DateTime, @dateformat_str
using TOML: TOML
using DataStructures: OrderedDict as Dict # watch out

using ..AdvisoryDB: AdvisoryDB, exists

# https://euvd.enisa.europa.eu/apidoc
const API_BASE = "https://euvdservices.enisa.europa.eu/api"
const DEFAULT_HOURS = 25

# I have no idea what mismatched vendor/product lengths mean.
# Sometimes they are broadcasting the same vendor across multiple products (e.g., EUVD-2025-1837)
# Sometimes it seems like ENISA just gave up on populating vendors (e.g., EUVD-2022-53926)
function vpzip(vendors,products)
    if length(vendors) == 1 && length(products) != 1
        vendors = fill(vendors[1], length(products))
    elseif length(vendors) < length(products)
        vendors = vcat(vendors, fill(Dict(), length(products) - length(vendors)))
    elseif length(vendors) > length(products)
        throw(ArgumentError("got more vendors than products"))
    end
    zip(vendors,products)
end
vendor_product_versions(vuln) = [(get(get(v, :vendor, Dict()), :name, ""), get(get(p, :product, Dict), :name, ""), get(p, :product_version, "")) for (v,p) in vpzip(vuln.enisaIdVendor, vuln.enisaIdProduct)]

function build_headers()
    headers = [
        "Accept" => "application/json",
        "User-Agent" => "Julia-NVD-Fetcher/1.0"
    ]

    return headers
end

function fetch_page(url::String, headers::Vector{Pair{String, String}})
    response = HTTP.get(url, headers)

    if response.status != 200
        error("Failed to fetch EUVD data: HTTP $(response.status)")
    end

    data = JSON3.read(response.body)
    return data
end

function fetch_all_pages(base_url, headers, params)
    haskey(params, "size") || (params["size"] = "100")
    haskey(params, "page") || (params["page"] = "0")
    # Fetch first page
    query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in params], "&")
    first_url = "$base_url?$query_string"
    data = fetch_page(first_url, headers)
    all_data = []
    key = :items
    if haskey(data, key)
        append!(all_data, getproperty(data, key))
        println("Fetched $(length(getproperty(data, key))) results from first page")

        # Check if there are more results
        total_results = data.total
        results_per_page = length(data.items)
        size = parse(Int, params["size"])
        page = parse(Int, params["page"])

        println("Total results available: $total_results")

        # Fetch remaining pages if needed
        while page*size + results_per_page < min(total_results,5000)
            page += 1

            # Update startIndex parameter
            new_params = copy(params)
            new_params["page"] = string(page)

            query_string = join(["$(k)=$(HTTP.escapeuri(v))" for (k, v) in new_params], "&")
            next_url = "$base_url?$query_string"

            sleep(5)
            data = fetch_page(next_url, headers)

            if haskey(data, key)
                append!(all_data, getproperty(data, key))
                println("Fetched $(length(getproperty(data, key))) results from page $(page+1)")
            end
        end
    end

    println("Total results fetched: $(length(all_data))")
    return all_data
end

function fetch_enisa(id)
    headers = build_headers()
    return fetch_page(string(API_BASE, "/enisaid?id=", id), headers)
end

function fetch_product_matches(vendor, product)
    headers = build_headers()

    params = Dict(
        "product" => product,
        "vendor" => vendor,
    )

    return fetch_all_pages(string(API_BASE, "/search"), headers, params)
end

function fetch_vulnerabilities()
    headers = build_headers()

    # Unfortunately these are _published_ dates, not modified ones.
    params = Dict(
        "fromDate" => Dates.format(Dates.today() - Dates.Day(2), "yyyy-mm-dd"),
    )

    return fetch_all_pages(string(API_BASE, "/search"), headers, params)
end

related_julia_packages(vuln) = AdvisoryDB.related_julia_packages(vuln.description, vendor_product_versions(vuln))

function filter_julia_vulnerabilities(vulnerabilities)
    julia_vulnerabilities = []

    for vuln in vulnerabilities
        if !isempty(related_julia_packages(vuln))
            push!(julia_vulnerabilities, vuln)
        end
    end

    return julia_vulnerabilities
end

vuln_id(vuln) = get(filter(startswith("CVE-"),  split(get(vuln, :aliases, ""))), 1,
                get(filter(startswith("GHSA-"), split(get(vuln, :aliases, ""))), 1, vuln.id))

parse_euvd_datetime(str) = string(DateTime(str, dateformat"u d, y, H:M:S p")) * "Z" # TODO: WHAT'S THE TIMEZONE??
function convert_to_osv(vuln)
    osv = Dict{String, Any}()

    # Required OSV fields
    osv["schema_version"] = "1.7.2"
    osv["id"] = vuln.id
    osv["modified"] = parse_euvd_datetime(vuln.dateUpdated)

    # Optional fields
    if exists(vuln, :datePublished)
        osv["published"] = parse_euvd_datetime(vuln.datePublished)
    end
    # No withdrawn information?
    # Aliases are typically missing GHSAs; those could come from references.
    aliases = String[]
    if exists(vuln, :aliases)
        append!(aliases, strip.(split(vuln.aliases, "\n"; keepempty=false)))
    end
    if !isempty(aliases)
        osv["aliases"] = aliases
    end
    # No upstream information
    # No related tags (beyond references)

    # Summary and details from descriptions, using English only
    if exists(vuln, :description)
        description = vuln.description
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
    if exists(vuln, :baseScoreVector) && exists(vuln, :baseScoreVersion)
        osv["severity"] = [Dict(
            "type" => "CVSS_V"*vuln.baseScoreVersion[1],
            "score" => string(vuln.baseScoreVector)
        )]
    end

    # Affected _Julia_ packages, connecting CPE data to the package.
    affected = []
    vpv = vendor_product_versions(vuln)
    julia_packages = related_julia_packages(vuln.description, vpv)
    if isempty(julia_packages)
        error("cannot convert an unrelated vulnerability to OSV. These should be filtered.")
    end
    # There are two cases; either the advisory is about the Julia package itself or its about an upstream component
    affected_entries = Dict(pkg => Dict{String,Any}("package"=>Dict("ecosystem"=>"Julia","name"=>pkg)) for pkg in julia_packages)
    for (vendor, product, version) in vpv
        for pkg in related_julia_packages(vuln.description, [(vendor, product)])
            entry = affected_entries[pkg]
            # The hard part is getting the version ranges right
            versions = get(entry, "versions", String[])
            range_events = get(entry, "_range_events", Dict{String,String}[]) # To be fixed up later; this needs to be nested
            for range in strip.(split(version, ","))
                isempty(range) && continue
                # EUVD's version strings are a disaster. If we're lucky, we get a clear < or ≤ operator with bounds
                # Sometimes this is comma separated, but that's rare.
                m = match(r"^\s*(\S+)?\s*([<≤])\s*(\S+)\s*$", range)
                isnothing(m) && contains(range, r"[<≤]") && error("failed to parse range $range")
                if isnothing(m)
                    push!(versions, range)
                else
                    lb, op, ub = m.captures
                    push!(range_events, Dict("introduced" => something(lb, "0")))
                    push!(range_events, Dict((op=='<' ? "fixed" : "last_affected") => ub))
                end
            end
            if !isempty(versions)
                entry["versions"] = versions
            end
            if !isempty(range_events)
                entry["_range_events"] = range_events
            end
        end
    end
    affected = []
    for (pkg, entry) in affected_entries
        if haskey(entry, "_range_events")
            entry["ranges"] = [Dict("type"=>"SEMVER", "events"=>entry["_range_events"])]
            delete!(entry, "_range_events")
        end
        push!(affected, entry)
    end
    if !isempty(affected)
        osv["affected"] = affected
    end

    # References
    references = []
    if haskey(vuln, :references)
        for ref in split(vuln.references, "\n")
            push!(references, Dict(
                "type" => "WEB",
                "url" => ref
            ))
        end
    end
    if !isempty(references)
        osv["references"] = references
    end

    # No structured credits
    return osv
end

end

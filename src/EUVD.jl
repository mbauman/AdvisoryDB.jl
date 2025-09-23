module EUVD

using HTTP
using JSON3
using Dates: Dates, DateTime, @dateformat_str
using TOML: TOML
using DataStructures: OrderedDict as Dict # watch out

using ..AdvisoryDB: AdvisoryDB, exists, Reference, Severity, Advisory, extract_summary

# https://euvd.enisa.europa.eu/apidoc
const API_BASE = "https://euvdservices.enisa.europa.eu/api"
const DEFAULT_HOURS = 25

# I have no idea what mismatched vendor/product lengths mean.
# Often all products are aligned with a vendor
# Sometimes they are broadcasting the same vendor across multiple products (e.g., EUVD-2025-1837)
# Sometimes it seems like ENISA just gave up on populating vendors (e.g., EUVD-2022-53926)
# Sometimes they are broadcasting the same product across multiple vendor aliases (e.g., EUVD-2022-7731)
function vpzip(vendors,products)
    if length(vendors) == 1 && length(products) != 1
        vendors = fill(vendors[1], length(products))
    elseif length(vendors) < length(products)
        vendors = vcat(vendors, fill(Dict(), length(products) - length(vendors)))
    elseif length(vendors) != 1 && length(products) == 1
        products = fill(products[1], length(vendors))
    else
        products = vcat(products, fill(Dict(), length(vendors) - length(products)))
    end
    zip(vendors,products)
end
function vendor_product_versions(vuln)
    [(get(get(v, :vendor, Dict()), :name, ""), get(get(p, :product, Dict), :name, ""), get(p, :product_version, "")) for (v,p) in vpzip(vuln.enisaIdVendor, vuln.enisaIdProduct)]
end

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

function fetch_advisory(id)
    headers = build_headers()
    return fetch_page(string(API_BASE, "/advisory?id=", id), headers)
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

affected_julia_packages(vuln) = AdvisoryDB.affected_julia_packages(vuln.description, vendor_product_versions(vuln))

function filter_julia_vulnerabilities(vulnerabilities)
    julia_vulnerabilities = []

    for vuln in vulnerabilities
        if !isempty(affected_julia_packages(vuln))
            push!(julia_vulnerabilities, vuln)
        end
    end

    return julia_vulnerabilities
end

vuln_id(vuln) = get(filter(startswith("CVE-"),  split(get(vuln, :aliases, ""))), 1,
                get(filter(startswith("GHSA-"), split(get(vuln, :aliases, ""))), 1, vuln.id))

parse_euvd_datetime(str) = DateTime(str, dateformat"u d, y, H:M:S p")
function advisory(vuln)
    affected = affected_julia_packages(vuln)
    upstream_type = Dict("alias"=>:aliases,"upstream"=>:upstream)[get(unique(map(x->x.source_type, affected)), 1, "alias")]

    return Advisory(;
        # withdrawn -- not structured; it's unstructured plaintext in the description :(
        upstream_type => String[vuln.id, strip.(split(get(vuln, :aliases, ""), "\n"; keepempty=false))...],
        # related -- nothing structured
        summary = if exists(vuln, :description) extract_summary(vuln.description) end,
        details = get(vuln, :description, nothing),
        severity = if exists(vuln, :baseScoreVector) && exists(vuln, :baseScoreVersion)
                Severity[Severity(type = "CVSS_V"*vuln.baseScoreVersion[1], score = string(vuln.baseScoreVector))]
            else
                Severity[]
            end,
        affected = affected,
        references = [Reference(url=ref) for ref in split(get(vuln, :references, ""), "\n"; keepempty=false)],
        # credits -- not structured
        database_specific = Dict{String,Any}("source" => Dict(
            "id" => vuln.id,
            "modified" => if exists(vuln, :dateUpdated) parse_euvd_datetime(vuln.dateUpdated) end,
            "published" => if exists(vuln, :datePublished) parse_euvd_datetime(vuln.datePublished) end,
            "imported" => Dates.now(Dates.UTC),
            "url" => string(API_BASE, "/enisaid?id=", vuln.id),
            "html_url" => string("https://euvd.enisa.europa.eu/vulnerability/", vuln.id)
            )
        )
    )
end

end

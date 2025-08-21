# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using AdvisoryDB: AdvisoryDB, NVD, EUVD, GitHub, VersionRange
using TOML: TOML

upstream_advisories = TOML.parsefile(joinpath(@__DIR__, "..", "upstream_advisories.toml"))
input = ARGS[1]
advisories = Dict{Tuple{String,String},Any}()
if startswith(input, "CVE")
    vuln = NVD.fetch_cve(input)
    pkgs = NVD.related_julia_packages(vuln)
    for (pkg, versioninfo) in pkgs
        advisories[(vuln.cve.id, pkg)] = versioninfo
    end
elseif startswith(input, "EUVD")
    error("todo")
elseif startswith(input, "GHSA")
    error("todo")
elseif contains(input, ":")
    _, vendor, product = rsplit(":"*input, ":", limit=3, keepempty=true)
    # Start with NVD; typically the best information but may be limited
    vulns = NVD.fetch_cpe_matches(startswith(input, "cpe:") ? input : "cpe:2.3:a:$vendor:$product")
    for vuln in vulns
        pkgs = NVD.related_julia_packages(vuln)
        for (pkg, versioninfo) in pkgs
            advisories[(vuln.cve.id, pkg)] = versioninfo
        end
    end
    # Add EUVD
    vulns = EUVD.fetch_product_matches(vendor, product)
    for vuln in vulns
        pkgs = EUVD.related_julia_packages(vuln)
        vuln_id = get(filter(startswith("CVE-"),  split(get(vuln, :aliases, ""))), 1,
                  get(filter(startswith("GHSA-"), split(get(vuln, :aliases, ""))), 1, vuln.id))
        for (pkg, versioninfo) in pkgs
            if haskey(advisories, (vuln_id, pkg))
                # We need to decide which is better; EUVD or CVE
                cve_info = advisories[(vuln_id, pkg)]
                if !isempty(cve_info) && cve_info != ["*"] && !isnothing(tryparse(AdvisoryDB.VersionRange, cve_info[1]))
                    continue # This qualifies as "good" information
                end
            end
            advisories[(vuln_id, pkg)] = versioninfo
        end
    end
else
    error("unknown argument")
end

for ((advisory_id, pkg), version_ranges) in advisories
    # TODO: Skip known aliases where **we** are the issuing advisory database
    upstream_advisory = get!(upstream_advisories, advisory_id, Dict{String,Any}())
    if haskey(upstream_advisory, pkg)
        if upstream_advisory[pkg] isa String
            @info "Skipping $advisory_id for $pkg because it is marked '$(upstream_advisory[pkg])'"
            continue
        else
            # TODO: What should the behavior be if something already exists? I suppose the most common style of automatic update would be where
            # a package releases a new "fixed" version. Should I try to detect that?  Should I union? How would I prevent the automatic updates
            # from continuoually suggesting something bad? Perhaps the most common case that's manually fixed would be where we get back a "*".
            if all(==("*"), version_ranges)
                continue
            end
        end
    end
    # This is a partial order sort, but these should be non-overlapping
    # TODO: Merge overlapping ranges here before saving them — they may overlap in cases where the Julia package
    #   didn't follow all upstream versions and thus does not require disjoint ranges
    upstream_advisory[pkg] = sort(version_ranges, by=x->something(tryparse(VersionRange{VersionNumber}, x), x), lt=<)
end

open(joinpath(@__DIR__, "..", "upstream_advisories.toml"),"w+") do f
    println(f, """
        # # This file contains a table of advisories and the packages to which they apply.")
        #
        # The schema is relatively simple:
        #   - Advisories are the top-level keys by ID
        #       - if multiple aliases exist, prefer CVE over GHSA over EUVD
        #   - Each advisory has Julia package names as its keys (without .jl suffix)
        #   - The value for a particular advisory[package] is either:
        #       - An array of GitHub Security Advisory style version ranges to which the advisory applies
        #       - A string detailing _why_ a given advisory does not apply
        #
        # This file is semi-automatically updated by suggested pull requests. By marking a package with an
        # exception string, you prevent further automatic updates from suggesting the advisory apply.
        """)
    TOML.print(f, upstream_advisories, sorted=true)
end

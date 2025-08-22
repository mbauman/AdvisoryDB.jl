# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using AdvisoryDB: AdvisoryDB, NVD, EUVD, GitHub, VersionRange
using TOML: TOML

function main()
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
        # The hardest part here is that we cannot search without a version number
        cpe = "cpe:2.3:a:$vendor:$product"
        nvds = NVD.fetch_cpe_matches(cpe, AdvisoryDB.upstream_versions_used_by_cpe(cpe))
        for vuln in nvds
            pkgs = NVD.related_julia_packages(vuln)
            for (pkg, versioninfo) in pkgs
                if startswith(pkg, "cpe:") && contains(pkg, "|")
                    pkg = split(pkg, "|")[2]
                    versioninfo = ["*"]
                    # TODO: Add debug information to the message body
                end
                advisories[(vuln.cve.id, pkg)] = versioninfo
            end
        end
        # Add EUVD
        euvds = EUVD.fetch_product_matches(vendor, product)
        for vuln in euvds
            pkgs = EUVD.related_julia_packages(vuln)
            vuln_id = get(filter(startswith("CVE-"),  split(get(vuln, :aliases, ""))), 1,
                    get(filter(startswith("GHSA-"), split(get(vuln, :aliases, ""))), 1, vuln.id))
            for (pkg, versioninfo) in pkgs
                if startswith(pkg, "cpe:") && contains(pkg, "|")
                    pkg = split(pkg, "|")[2]
                    versioninfo = ["*"]
                    # TODO: Add debug information to the message body
                end
                if haskey(advisories, (vuln_id, pkg))
                    # We need to decide who has better information; EUVD or CVE
                    cve_info = advisories[(vuln_id, pkg)]
                    if !isempty(cve_info) && cve_info != [""] && cve_info != ["*"] && !isnothing(tryparse(AdvisoryDB.VersionRange{VersionNumber}, cve_info[1]))
                        continue # This qualifies as "good" information
                    end
                end
                # Sometimes EUVD picks up advisories that our NVD search didn't return.
                # It's worth going back to see if we can pick up better information from there
                # one-by-one
                if versioninfo == ["*"] && vuln_id ∉ (x->x.cve.id).(nvds)
                    sleep(6)
                    vuln = NVD.fetch_cve(vuln_id)
                    pkgs = NVD.related_julia_packages(vuln)
                    for (nvd_pkg, nvd_info) in pkgs
                        pkg == nvd_pkg || continue
                        versioninfo = nvd_info # Can't be worse!
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
        saved_advisory = get!(upstream_advisories, advisory_id, Dict{String,Any}())
        if haskey(saved_advisory, pkg)
            if saved_advisory[pkg] isa String
                @info "Skipping $advisory_id for $pkg because it is marked '$(saved_advisory[pkg])'"
                continue
            else
                # TODO: What should the behavior be if something already exists? I suppose the most common style of automatic update would be where
                # a package releases a new "fixed" version. Should I try to detect that?  Should I union? How would I prevent the automatic updates
                # from continuoually suggesting something bad? Perhaps the most common case that's manually fixed would be where we get back a "*".
                if all(==("*"), version_ranges)
                    @info "Skipping overwriting $advisory_id for $pkg because the computed version range is $version_ranges; we have $(saved_advisory[pkg]) saved"
                    continue
                end
            end
        end
        # This is a partial order sort, but these should be non-overlapping
        # TODO: Merge overlapping ranges here before saving them — they may overlap in cases where the Julia package
        #   didn't follow all upstream versions and thus does not require disjoint ranges
        saved_advisory[pkg] = sort(version_ranges, by=x->something(tryparse(VersionRange{VersionNumber}, x), x), lt=<)
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
end

main()

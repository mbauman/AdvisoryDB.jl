# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using AdvisoryDB: AdvisoryDB, NVD, EUVD, GitHub, VersionRange
using TOML: TOML
using Dates: Dates

function main()
    input = get(ARGS, 1, "")
    advisories = Dict{String,Any}()
    info = Dict{String,Any}()
    info["haystack"] = input
    info["haystack_total"] = String[]
    if startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        advisories[input] = AdvisoryDB.fetch_advisory(input)
        push!(info["haystack_total"], "1 advisory ($input)")
    else
        # A larger joint EUVD/NVD search, either by vendor:product or time. It's helpful to gather as
        # many vulns as possible with these higher-level searches before going one-by-one due to API limits
        if startswith(input, "--project")
            _, proj= split(input, [' ','='])
            vendorproducts = [k for (k,v) in AdvisoryDB.upstream_projects_by_vendor_product() if v == proj]
            nvds = []
            euvds = []
            for (vendor, product) in vendorproducts
                nvdspart, euvdspart = AdvisoryDB.fetch_product_matches(vendor, product)
                append!(nvds, nvdspart)
                append!(euvds, euvdspart)
            end
        elseif contains(input, ":")
            _, vendor, product = rsplit(":"*input, ":", limit=3, keepempty=true)
            info["haystack"] = "search $vendor/$product"
            nvds, euvds = AdvisoryDB.fetch_product_matches(vendor, product)
        else
            info["haystack"] = "searching recent NVD changes and EUVD publications"
            nvds = NVD.fetch_nvd_vulnerabilities()
            euvds = EUVD.fetch_vulnerabilities()
        end

        joint_ids = intersect(filter(startswith("CVE"), EUVD.vuln_id.(euvds)), (x->x.cve.id).(nvds))

        for vuln in euvds
            # EUVD is largely useful in having a sloppier search. Sometimes they have more recently-populated
            # product/version data. But we still trust NVD first, only falling back to EUVD. This finds applicable
            # advisories and adds them to the NVD pile.
            vuln_id = EUVD.vuln_id(vuln)
            vuln_id in joint_ids && continue
            euvd_adv = EUVD.advisory(vuln)
            AdvisoryDB.is_vulnerable(euvd_adv) || continue
            startswith(vuln_id, "CVE") || continue
            sleep(6)
            try
                push!(nvds, NVD.fetch_cve(vuln_id))
            catch _
            end
        end

        push!(info["haystack_total"], "$(length(nvds)) advisories from NVD")
        for vuln in nvds
            adv = NVD.advisory(vuln)
            AdvisoryDB.is_vulnerable(adv) || continue
            advisories[vuln.cve.id] = adv
            if any(!AdvisoryDB.has_upper_bound, adv.affected)
                # See if we can get a tighter answer with EUVD data
                euvd = get(euvds[EUVD.vuln_id.(euvds) .== vuln.cve.id], 1) do
                    try EUVD.fetch_enisa(vuln.cve.id) catch _; nothing end
                end
                isnothing(euvd) && continue
                euvd_adv = EUVD.advisory(euvd)
                if all(AdvisoryDB.has_upper_bound(euvd_adv.affected))
                    adv.affected = euvd_adv.affected
                    adv.database_specific["affected_source"] = euvd_adv.database_specific["source"]
                end
            end
        end
    end

    # Now create or update the found advisories:
    n_modified = 0
    for (id, advisory) in advisories
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(Dates.year(Dates.now()))))
        file = joinpath(dir, "DONOTUSEJLSEC-0000-$id.md")
        n_existing += isfile(file)
        open(file, "w") do io
            AdvisoryDB.print(io, advisory)
        end
    end
    n_total = length(advisories)
    n_created = n_total - n_modified

    # Nice logging information for the possible pull request
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    verb = n_modified > 0 && n_created == 0 ? "Update" :
           n_modified == 0 && n_created > 0 ? "Publish" : "Publish and update"
    unique_pkgs = unique(Iterators.flatten(vulnerable_packages.(values(advisories))))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "body<<BODY_EOF")
    println(io, "This action searched `", info["haystack"], "`, checking ", join(info["haystack_total"], ", ", " and "), " for advisories that pertain here. ",
        "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", join("**" .* unique_pkgs .* "**", ", ", ", and "), ".")
    println(io)

    divide(f, x) = return (filter(f, x), filter(!f, x))

    # Now break the identified advisories into three sections.  First, advisories for which failed to parse the upstream version:
    failed_advisories, advisories = divide(((_,v),)->any(isnothing, (tryparse(AdvisoryDB.VersionRange, r) for entry in v.affected for (_,source_map) in entry.source_mapping for (r, _) in source_map)), advisories)

    failed_ids = unique(keys(failed_advisories))
    !isempty(failed_ids) && println(io, "### $(length(unique(failed_ids))) advisories failed to parse the source version range\n\nThese advisories seem to apply to a Julia package but had trouble identifying exactly how and at which versions.")
    for id in failed_ids
    #     pkgs = last.(filter(==(id)∘first, keys(failed_advisories)))
    #     println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
    #     for pkg in pkgs
    #         println(io, "    * **$pkg**, using data from ", advisory_sources[(id, pkg)])
    #         println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
    #     end
    end
    # !isempty(failed_ids) && println(io)

    # # Next advisories for which all versions apply
    # star_advisories, advisories = divide(==(["*"])∘last, advisories)
    # star_ids = unique(id for (id, pkg) in keys(star_advisories))
    # !isempty(star_ids) && println(io, "### $(length(unique(star_ids))) advisories apply to all registered versions of a package\n\nThese advisories had no obvious failures but computed a range without bounds.")
    # for id in star_ids
    #     pkgs = last.(filter(==(id)∘first, keys(star_advisories)))
    #     println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
    #     for pkg in pkgs
    #         println(io, "    * **$pkg**, using data from ", advisory_sources[(id, pkg)])
    #         println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
    #     end
    # end
    # !isempty(star_ids) && println(io)

    # # Next advisories for which there's an unbounded upper range
    # unbounded_advisories, advisories = divide(((_,v),)->any(!AdvisoryDB.has_upper_bound∘VersionRange, v), advisories)
    # unbounded_ids = unique(id for (id, pkg) in keys(unbounded_advisories))
    # !isempty(unbounded_ids) && println(io, "### $(length(unique(unbounded_ids))) advisories apply to all registered versions of a package\n\nThese advisories had no obvious failures but computed a range without bounds.")
    # for id in unbounded_ids
    #     pkgs = last.(filter(==(id)∘first, keys(unbounded_advisories)))
    #     println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
    #     for pkg in pkgs
    #         println(io, "    * **$pkg** computed `$(repr(unbounded_advisories[(id, pkg)]))` using data from ", advisory_sources[(id, pkg)])
    #         println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
    #     end
    # end
    # !isempty(unbounded_ids) && println(io)

    # # And finally all remaining advisories.
    # remaining_ids = unique(id for (id, pkg) in keys(advisories))
    # !isempty(advisories) && println(io, "### $(length(unique(advisories))) advisories found concrete vulnerable ranges\n\n")
    # for id in remaining_ids
    #     pkgs = last.(filter(==(id)∘first, keys(advisories)))
    #     println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
    #     for pkg in pkgs
    #         println(io, "    * **$pkg** computed `$(repr(advisories[(id, pkg)]))` using data from ", advisory_sources[(id, pkg)])
    #         println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
    #     end
    # end
    # !isempty(advisories) && println(io)

    println(io, "BODY_EOF")
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

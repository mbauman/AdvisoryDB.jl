# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using AdvisoryDB: AdvisoryDB, NVD, EUVD, GitHub, VersionRange
using TOML: TOML


function main()
    upstream_advisories_file = joinpath(@__DIR__, "..", "upstream_advisories.toml")
    upstream_advisories = isfile(upstream_advisories_file) ? TOML.parsefile(upstream_advisories_file) : Dict{String, Any}()
    input = get(ARGS, 1, "")
    advisories = Dict{Tuple{String,String},Any}()
    advisory_details = Dict{Tuple{String,String},Any}()
    advisory_sources = Dict{Tuple{String,String},Any}()
    info = Dict{String,Any}()
    info["haystack"] = input
    info["haystack_total"] = String[]
    info["version_trouble"] = String[]
    info["skips"] = String[]
    specific_advisory_import = false
    if startswith(input, "CVE")
        vuln = NVD.fetch_cve(input)
        pkgs = NVD.affected_julia_packages(vuln)
        push!(info["haystack_total"], "1 advisory from NVD")
        specific_advisory_import = true
        for (pkg, versioninfo, whys) in pkgs
            advisories[(vuln.cve.id, pkg)] = versioninfo
            advisory_details[(vuln.cve.id, pkg)] = whys
            advisory_sources[(vuln.cve.id, pkg)] = "[$(vuln.cve.id) (NVD)](https://nvd.nist.gov/vuln/detail/$(vuln.cve.id))"
        end
    elseif startswith(input, "EUVD")
        vuln = EUVD.fetch_enisa(input)
        pkgs = EUVD.affected_julia_packages(vuln)
        push!(info["haystack_total"], "1 advisory from EUVD")
        specific_advisory_import = true
        vuln_id = EUVD.vuln_id(vuln)
        for (pkg, versioninfo, whys) in pkgs
            advisories[(vuln_id, pkg)] = versioninfo
            advisory_details[(vuln.cve.id, pkg)] = whys
            advisory_sources[(vuln.cve.id, pkg)] = "[$(vuln.cve.id) (NVD)](https://nvd.nist.gov/vuln/detail/$(vuln.cve.id))"
        end
    elseif endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        vuln = GitHub.fetch_ghsa(input)
        pkgs = GitHub.affected_julia_packages(vuln)
        push!(info["haystack_total"], "1 advisory from GitHub")
        specific_advisory_import = true
        vuln_id = GitHub.vuln_id(vuln, input)
        for (pkg, versioninfo, whys) in pkgs
            advisories[(vuln_id, pkg)] = versioninfo
            advisory_details[(vuln_id, pkg)] = whys
            advisory_sources[(vuln_id, pkg)] = "[$vuln_id (GHSA)]($(vuln.html_url))"
        end
    else
        # A larger joint EUVD/NVD search, either by vendor:product or time
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

        push!(info["haystack_total"], "$(length(nvds)) advisories from NVD")
        for vuln in nvds
            pkgs = NVD.affected_julia_packages(vuln)
            had_trouble = false
            for (pkg, versioninfo, whys) in pkgs
                advisories[(vuln.cve.id, pkg)] = versioninfo
                advisory_details[(vuln.cve.id, pkg)] = whys
                advisory_sources[(vuln.cve.id, pkg)] = "[$(vuln.cve.id) (NVD)](https://nvd.nist.gov/vuln/detail/$(vuln.cve.id))"
                had_trouble |= any(startswith("fail"), whys) || versioninfo == ["*"]
            end
            if had_trouble
                if vuln.cve.id in joint_ids
                    euvd = euvds[EUVD.vuln_id.(euvds) .== vuln.cve.id][1]
                    euvd_pkgs = EUVD.affected_julia_packages(euvd)
                    for (pkg, versioninfo, whys) in euvd_pkgs
                        (haskey(advisories, (vuln.cve.id, pkg)) && advisories[(vuln.cve.id, pkg)] != ["*"]) && continue
                        advisories[(vuln.cve.id, pkg)] = versioninfo
                        advisory_details[(vuln.cve.id, pkg)] = whys
                        advisory_sources[(vuln.cve.id, pkg)] = "[EUVD](https://euvd.enisa.europa.eu/vulnerability/$(euvd.id))"
                    end
                end
            end
        end
        # Add remaining EUVDs
        push!(info["haystack_total"], "$(length(euvds)) advisories from EUVD")
        nvd_fixups = 0
        for vuln in euvds
            vuln_id = EUVD.vuln_id(vuln)
            vuln_id in joint_ids && continue
            pkgs = EUVD.affected_julia_packages(vuln)
            for (pkg, versioninfo, whys) in pkgs
                advisories[(vuln_id, pkg)] = versioninfo
                advisory_details[(vuln_id, pkg)] = whys
                advisory_sources[(vuln_id, pkg)] = "[$vuln_id (EUVD)](https://euvd.enisa.europa.eu/vulnerability/$(vuln.id))"
            end
        end
    end

    n_created = 0
    n_updated = 0
    for ((advisory_id, pkg), version_ranges) in advisories
        # TODO: Skip known aliases where **we** are the originating advisory database
        saved_advisory = get!(upstream_advisories, advisory_id, Dict{String,Any}())
        if haskey(saved_advisory, pkg)
            if saved_advisory[pkg] isa String
                push!(info["skips"], "$advisory_id: skipped because it is marked '$(saved_advisory[pkg])'")
                continue
            else
                # We haved saved information. Avoid overwriting it _unless_ we very specifically asked for this very advisory explicitly
                if !specific_advisory_import
                    # Only report this if there's a substantive change though
                    saved_advisory[pkg] != version_ranges && push!(info["skips"], "$advisory_id: skipped overwriting the existing $pkg=>$(saved_advisory[pkg]) with $version_ranges because we didn't explicitly ask for this advisory")
                    continue
                end
            end
            n_updated += 1
        else
            n_created += 1
        end
        # This is a partial order sort, but these should be non-overlapping
        saved_advisory[pkg] = sort(version_ranges, by=x->something(tryparse(VersionRange{VersionNumber}, x), x), lt=<)
    end

    # Nice logging information for the possible
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    verb = n_updated > 0 && n_created == 0 ? "Update" :
           n_updated == 0 && n_created > 0 ? "Newly tag" : "Modify"
    unique_pkgs = unique(last.(keys(advisories)))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    n_total = n_updated+n_created
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "body<<BODY_EOF")
    println(io, "This action searched `", info["haystack"], "`, checking ", join(info["haystack_total"], ", ", " and "), " for advisories that pertain here. ",
        "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", join("**" .* unique_pkgs .* "**", ", ", ", and "), ".")
    println(io)
    divide(f, x) = return (filter(f, x), filter(!f, x))

    # Now break the identified advisories into three sections.  First, advisories for which we reported clear failures:
    failed_advisories, advisories = divide(((k,v),)->any(startswith("fail"), advisory_details[k]), advisories)

    failed_ids = unique(id for (id, pkg) in keys(failed_advisories))
    !isempty(failed_ids) && println(io, "### $(length(unique(failed_ids))) advisories had obvious failures\n\nThese advisories seem to apply to a Julia package but had trouble identifying exactly how and at which versions.")
    for id in failed_ids
        pkgs = last.(filter(==(id)∘first, keys(failed_advisories)))
        println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for pkg in pkgs
            println(io, "    * **$pkg**, using data from ", advisory_sources[(id, pkg)])
            println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
        end
    end
    !isempty(failed_ids) && println(io)

    # Next advisories for which all versions apply
    star_advisories, advisories = divide(==(["*"])∘last, advisories)
    star_ids = unique(id for (id, pkg) in keys(star_advisories))
    !isempty(star_ids) && println(io, "### $(length(unique(star_ids))) advisories apply to all registered versions of a package\n\nThese advisories had no obvious failures but computed a range without bounds.")
    for id in star_ids
        pkgs = last.(filter(==(id)∘first, keys(star_advisories)))
        println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for pkg in pkgs
            println(io, "    * **$pkg**, using data from ", advisory_sources[(id, pkg)])
            println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
        end
    end
    !isempty(star_ids) && println(io)

    # Next advisories for which there's an unbounded upper range
    unbounded_advisories, advisories = divide(((_,v),)->any(!AdvisoryDB.has_upper_bound∘VersionRange, v), advisories)
    unbounded_ids = unique(id for (id, pkg) in keys(unbounded_advisories))
    !isempty(unbounded_ids) && println(io, "### $(length(unique(unbounded_ids))) advisories apply to all registered versions of a package\n\nThese advisories had no obvious failures but computed a range without bounds.")
    for id in unbounded_ids
        pkgs = last.(filter(==(id)∘first, keys(unbounded_advisories)))
        println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for pkg in pkgs
            println(io, "    * **$pkg** computed `$(repr(unbounded_advisories[(id, pkg)]))` using data from ", advisory_sources[(id, pkg)])
            println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
        end
    end
    !isempty(unbounded_ids) && println(io)

    # And finally all remaining advisories.
    remaining_ids = unique(id for (id, pkg) in keys(advisories))
    !isempty(advisories) && println(io, "### $(length(unique(advisories))) advisories found concrete vulnerable ranges\n\n")
    for id in remaining_ids
        pkgs = last.(filter(==(id)∘first, keys(advisories)))
        println(io, "* $id for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for pkg in pkgs
            println(io, "    * **$pkg** computed `$(repr(advisories[(id, pkg)]))` using data from ", advisory_sources[(id, pkg)])
            println(io, "        * " * join(advisory_details[(id, pkg)], "\n        * "))
        end
    end
    !isempty(advisories) && println(io)

    if !isempty(info["skips"])
        println(io, "There were $(length(info["skips"])) advisories skipped for the following reasons:")
        println(io, join("* " .* info["skips"], "\n"))
        println(io)
    end
    println(io, """
        The version ranges tagged here should be confirmed or adjusted, and if the particular advisory is not applicable to a given package, its value should instead be a string detailing the rationale.
        BODY_EOF""")
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout

    open(upstream_advisories_file,"w+") do f
        println(f, """
            ### This file contains a table of advisories and the packages to which they apply ###
            #
            # The schema is relatively simple:
            #   - Advisories are the top-level keys by ID
            #       - if multiple aliases exist, prefer CVE over GHSA over EUVD
            #   - Each advisory entry has Julia package names (without .jl suffix) as its keys
            #   - The value for a particular advisory[package] is either:
            #       - A list of GitHub Security Advisory style version ranges to which the advisory applies
            #       - A string detailing _why_ a given advisory does not apply
            #
            # This file is semi-automatically updated by suggested pull requests. By marking a package with an
            # exception string, you prevent further automatic updates from suggesting the advisory apply.
            """)
        TOML.print(f, upstream_advisories, sorted=true)
    end
end

main()

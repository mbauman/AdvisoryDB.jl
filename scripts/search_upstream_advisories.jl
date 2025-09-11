# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using AdvisoryDB: AdvisoryDB, NVD, EUVD, GitHub, VersionRange
using TOML: TOML


function main()
    upstream_advisories_file = joinpath(@__DIR__, "..", "upstream_advisories.toml")
    upstream_advisories = isfile(upstream_advisories_file) ? TOML.parsefile(upstream_advisories_file) : Dict{String, Any}()
    input = get(ARGS, 1, "")
    advisories = Dict{Tuple{String,String},Any}()
    info = Dict{String,Any}()
    info["haystack"] = input
    info["haystack_total"] = String[]
    info["version_trouble"] = String[]
    info["skips"] = String[]
    specific_advisory_import = false
    if startswith(input, "CVE")
        vuln = NVD.fetch_cve(input)
        pkgs, _ = NVD.related_julia_packages(vuln)
        push!(info["haystack_total"], "1 advisory from NVD")
        specific_advisory_import = true
        for (pkg, versioninfo) in pkgs
            advisories[(vuln.cve.id, pkg)] = versioninfo
        end
    elseif startswith(input, "EUVD")
        vuln = EUVD.fetch_enisa(input)
        pkgs, _ = EUVD.related_julia_packages(vuln)
        push!(info["haystack_total"], "1 advisory from EUVD")
        specific_advisory_import = true
        vuln_id = EUVD.vuln_id(vuln)
        for (pkg, versioninfo) in pkgs
            advisories[(vuln_id, pkg)] = versioninfo
        end
    elseif endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        vuln = GitHub.fetch_ghsa(input)
        pkgs, _ = GitHub.related_julia_packages(vuln)
        push!(info["haystack_total"], "1 advisory from GitHub")
        specific_advisory_import = true
        vuln_id = GitHub.vuln_id(vuln, input)
        for (pkg, versioninfo) in pkgs
            advisories[(vuln_id, pkg)] = versioninfo
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
            pkgs, troubles = NVD.related_julia_packages(vuln)
            for (pkg, versioninfo) in pkgs
                advisories[(vuln.cve.id, pkg)] = versioninfo
            end
            if !isempty(troubles)
                if vuln.cve.id in joint_ids
                    euvd = euvds[EUVD.vuln_id.(euvds) .== vuln.cve.id][1]
                    euvd_pkgs, euvd_troubles = EUVD.related_julia_packages(euvd)
                    for (pkg, versioninfo) in euvd_pkgs
                        (haskey(advisories, (vuln.cve.id, pkg)) && advisories[(vuln.cve.id, pkg)] != ["*"]) && continue
                        advisories[(vuln.cve.id, pkg)] = versioninfo
                    end
                    if !iempty(euvd_troubles)
                        push!(info["version_trouble"], "* [$(vuln.cve.id) (NVD)](https://nvd.nist.gov/vuln/detail/$(vuln.cve.id)) and [EUVD](https://euvd.enisa.europa.eu/vulnerability/$(euvd.id)) both reported problems:\n  * EUVD: " * join(euvd_troubles, "\n  *  EUVD: ") * "\n  * NVD: " * join(troubles, "\n  * NVD: "))
                    end
                end
                push!(info["version_trouble"], "* [$(vuln.cve.id) (NVD)](https://nvd.nist.gov/vuln/detail/$(vuln.cve.id)) reported problems:\n  *" * join(troubles, "\n  * "))
            end
        end
        # Add remaining EUVDs
        push!(info["haystack_total"], "$(length(euvds)) advisories from EUVD")
        nvd_fixups = 0
        for vuln in euvds
            vuln_id = EUVD.vuln_id(vuln)
            vuln_id in joint_ids && continue
            pkgs, troubles = EUVD.related_julia_packages(vuln)
            for (pkg, versioninfo) in pkgs
                advisories[(vuln_id, pkg)] = versioninfo
            end
            if !isempty(troubles)
                push!(info["version_trouble"], "* [$vuln_id (EUVD)](https://euvd.enisa.europa.eu/vulnerability/$(vuln.id)) reported problems:\n  *" * join(troubles, "\n  * "))
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
    haystack_results_str = join(info["haystack_total"], ", ", " and ")
    troubled_versions = filter(((k,v),)->v==["*"], advisories)
    troubled_info_str = join(info["version_trouble"], "\n")
    version_trouble_str = isempty(troubled_versions) ? "" :
        """

        There are $(length(troubled_versions)) advisories that apply to all registered versions: $(string(collect(troubled_versions)))
        $troubled_info_str

        """
    skips_str = isempty(info["skips"]) ? "" :
        """

        There were $(length(info["skips"])) advisories skipped for the following reasons:
        $(join("* " .* info["skips"], "\n"))
        """
    println(io, """
        body<<BODY_EOF
        This action searched `$(info["haystack"])`, checking $haystack_results_str for relevancy. It identified $n_total $advisory_str as being related to the Julia package(s): $(join("**" .* unique_pkgs .* "**", ", ", ", and ")).
        $version_trouble_str
        $skips_str

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

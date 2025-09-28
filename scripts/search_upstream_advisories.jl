# The goal here is to find relevant upstream advisories that have been published in an upstream
# database: GitHub's GHSA, NIST/NVD's CVE, or ESINA's EUVD.
using SecurityAdvisories: SecurityAdvisories, NVD, EUVD, GitHub, VersionRange
using TOML: TOML
using Dates: Dates

function main()
    input = get(ARGS, 1, "")
    advisories = Dict{String,Any}()
    info = Dict{String,Any}()
    info["haystack"] = input
    info["haystack_total"] = String[]
    if startswith(input, "CVE") || startswith(input, "EUVD") || endswith(input, r"GHSA-\w{4}-\w{4}-\w{4}")
        advisories[input] = SecurityAdvisories.fetch_advisory(input)
        push!(info["haystack_total"], "1 advisory ($input)")
    else
        # A larger joint EUVD/NVD search, either by vendor:product or time. It's helpful to gather as
        # many vulns as possible with these higher-level searches before going one-by-one due to API limits
        if startswith(input, "--project")
            _, proj= split(input, [' ','='])
            vendorproducts = [k for (k,v) in SecurityAdvisories.upstream_projects_by_vendor_product() if v == proj]
            nvds = []
            euvds = []
            for (vendor, product) in vendorproducts
                nvdspart, euvdspart = SecurityAdvisories.fetch_product_matches(vendor, product)
                append!(nvds, nvdspart)
                append!(euvds, euvdspart)
            end
        elseif contains(input, ":")
            _, vendor, product = rsplit(":"*input, ":", limit=3, keepempty=true)
            nvds, euvds = SecurityAdvisories.fetch_product_matches(vendor, product)
        else
            info["haystack"] = "recent NVD/EUVD changes/publications"
            nvds = NVD.fetch_nvd_vulnerabilities()
            euvds = EUVD.fetch_vulnerabilities()
        end

        found_nvds = length(nvds)
        found_euvds = length(euvds)
        additional_nvds = 0
        additional_euvds = 0
        joint_ids = intersect(filter(startswith("CVE"), EUVD.vuln_id.(euvds)), (x->x.cve.id).(nvds))

        missing_nvds = found_euvds - length(joint_ids)
        for vuln in euvds
            # EUVD is largely useful in having a sloppier search and some more-recently-populated
            # product/version data. Always trust NVD first, only falling back to EUVD. This finds
            # applicable advisories and adds them to the NVD pile. Ideally, this would always add
            # all the missing NVDs here, but that's quite expensive at 6 seconds per fetch.
            vuln_id = EUVD.vuln_id(vuln)
            @info "EUVD $vuln_id"
            startswith(vuln_id, "CVE") || continue
            vuln_id in joint_ids && continue
            # Only add the missing NVD advisory if there are only a few (6 minutes worth) or we know it's relevant
            if missing_nvds <= 100 || SecurityAdvisories.is_vulnerable(EUVD.advisory(vuln))
                sleep(6)
                try
                    push!(nvds, NVD.fetch_cve(vuln_id))
                    additional_nvds += 1
                catch ex
                    @info "failed to fetch NVD $vuln_id" ex
                end
            end
        end

        for vuln in nvds
            @info "NVD $(vuln.cve.id)"
            adv = NVD.advisory(vuln)
            if isempty(adv.affected) || !all(SecurityAdvisories.has_upper_bound, adv.affected)
                # See if we can get a tighter answer with EUVD data
                euvd = get(euvds[EUVD.vuln_id.(euvds) .== vuln.cve.id], 1) do
                    additional_euvds += 1
                    try EUVD.fetch_enisa(vuln.cve.id) catch _; nothing end
                end
                isnothing(euvd) && continue
                @info "EUVD $(euvd.id)"
                euvd_adv = EUVD.advisory(euvd)
                if !isempty(euvd_adv.affected) && all(SecurityAdvisories.has_upper_bound, euvd_adv.affected)
                    adv.affected = euvd_adv.affected
                    affected_src = euvd_adv.jlsec_sources[1]
                    push!(affected_src.fields, "affected")
                    push!(adv.jlsec_sources, affected_src)
                    # TODO: ensure that the EUVD id is also listed as an alias or upstream. Gotta know which one, though
                end
            end
            if SecurityAdvisories.is_vulnerable(adv)
                advisories[vuln.cve.id] = adv
            end
        end
        push!(info["haystack_total"], "$found_nvds (+$additional_nvds) advisories from NVD")
        push!(info["haystack_total"], "$found_euvds (+$additional_euvds) from EUVD")
    end

    # Now create or update the found advisories:
    n_modified = 0
    for (id, advisory) in advisories
        existing = find_existing_jlsec(advisory.id, vcat(advisory.upstream, advisory.aliases))
        if !isnothing(existing)
            advisory = update(existing, advisory)
        end
        @info "JLSEC for $id: $(advisory.id)"
        dir = mkpath(joinpath(@__DIR__, "..", "advisories", "published", string(year(advisory))))
        file = joinpath(dir, advisory.id * ".md")
        n_modified += isfile(file)
        open(file, "w") do io
            SecurityAdvisories.print(io, advisory)
        end
    end
    n_total = length(advisories)
    n_created = n_total - n_modified

    # Nice logging information for the possible pull request
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    verb = n_modified > 0 && n_created == 0 ? "Update" :
           n_modified == 0 && n_created > 0 ? "Publish" : "Publish and update"
    unique_pkgs = unique(Iterators.flatten(SecurityAdvisories.vulnerable_packages.(values(advisories))))
    pkg_str = length(unique_pkgs) <= 3 ? join(unique_pkgs, ", ", " and ") : "$(length(unique_pkgs)) packages"
    advisory_str = n_total == 1 ? "advisory" : "advisories"
    println(io, "title=[automatic] $verb $n_total $advisory_str for $pkg_str")
    println(io, "body<<BODY_EOF")
    println(io, "This action searched `", info["haystack"], "`, checking ", join(info["haystack_total"], ", ", " and "), " for advisories that pertain here. ",
        "It identified ", n_total, " ", advisory_str, " as being related to the Julia package(s): ", join("**" .* unique_pkgs .* "**", ", ", ", and "), ".")
    println(io)

    divide(f, x) = return (filter(f, x), filter(!f, x))

    # Now break the identified advisories into three sections.  First, advisories for which failed to parse the upstream version:
    failed_advisories, advisories = divide(((_,v),)->any(isnothing, (tryparse(SecurityAdvisories.VersionRange, r) for entry in v.affected for (_,source_map) in entry.source_mapping for (r, _) in source_map)), advisories)
    !isempty(failed_advisories) && println(io, "### $(length(failed_advisories)) advisories failed to parse the source version range\n\nThese advisories seem to apply to a Julia package but had trouble identifying exactly how and at which versions.")
    for (id, adv) in sort(failed_advisories)
        pkgs = SecurityAdvisories.vulnerable_packages(adv)
        affectedsrcidx = something(findlast(x->"affected" in x.fields, adv.jlsec_sources), 1)
        html_url = get(adv.jlsec_sources, affectedsrcidx, (;html_url="")).html_url
        println(io, "* [$id]($html_url) for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for entry in adv.affected
            println(io, "    * **$(entry.pkg)**, matching `", join(keys(entry.source_mapping), "`, `", "`, and `"), "`. Failures include:")
            for (source, version_map) in entry.source_mapping
                for (v, _) in version_map
                    isnothing(tryparse(SecurityAdvisories.VersionRange, v)) || continue
                    println(io, "        * `", source, "` version `", v, "`")
                end
            end
        end
    end
    !isempty(failed_advisories) && println(io)

    # Next advisories for which all versions apply
    star_advisories, advisories = divide(((_,x),)->any(entry->entry.ranges==[VersionRange{VersionNumber}("*")], x.affected), advisories)
    !isempty(star_advisories) && println(io, "### $(length(star_advisories)) advisories apply to all registered versions of a package\n\nThese advisories had no obvious failures but computed a range without bounds.")
    for (id, adv) in sort(star_advisories)
        pkgs = SecurityAdvisories.vulnerable_packages(adv)
        affectedsrcidx = something(findlast(x->"affected" in x.fields, adv.jlsec_sources), 1)
        html_url = get(adv.jlsec_sources, affectedsrcidx, (;html_url="")).html_url
        println(io, "* [$id]($html_url) for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for entry in adv.affected
            println(io, "    * **$(entry.pkg)**, matching `", join(keys(entry.source_mapping), "`, `", "`, and `"), "`. Unbounded mappings are:")
            for (source, version_map) in entry.source_mapping
                for (v, r) in version_map
                    r == [VersionRange{VersionNumber}("*")] || continue
                    println(io, "        * `", source, "` version `", v, "`")
                end
            end
        end
    end
    !isempty(star_advisories) && println(io)

    # Next advisories for which there's an unbounded upper range
    unbounded_advisories, advisories = divide(((_,x),)->any(entry->any(!SecurityAdvisories.has_upper_bound, entry.ranges), x.affected), advisories)
    !isempty(unbounded_advisories) && println(io, "### $(length(unbounded_advisories)) advisories apply to the latest version of a package and do not have a patch")
    for (id, adv) in sort(unbounded_advisories)
        pkgs = SecurityAdvisories.vulnerable_packages(adv)
        affectedsrcidx = something(findlast(x->"affected" in x.fields, adv.jlsec_sources), 1)
        html_url = get(adv.jlsec_sources, affectedsrcidx, (;html_url="")).html_url
        println(io, "* [$id]($html_url) for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for entry in adv.affected
            println(io, "    * **$(entry.pkg)**, matching `", join(keys(entry.source_mapping), "`, `", "`, and `"), "`. Unbounded mappings are:")
            for (source, version_map) in entry.source_mapping
                for (v, r) in version_map
                    all(SecurityAdvisories.has_upper_bound, r) && continue
                    println(io, "        * `", source, "` version `", v, "` mapped to `[", join(string.(r), ", "), "]`")
                end
            end
        end
    end
    !isempty(unbounded_advisories) && println(io)

    # And finally all remaining advisories.
    !isempty(advisories) && println(io, "### $(length(advisories)) advisories found concrete vulnerable ranges\n\n")
    for (id, adv) in sort(advisories)
        pkgs = SecurityAdvisories.vulnerable_packages(adv)
        affectedsrcidx = something(findlast(x->"affected" in x.fields, adv.jlsec_sources), 1)
        html_url = get(adv.jlsec_sources, affectedsrcidx, (;html_url="")).html_url
        println(io, "* [$id]($html_url) for packages: ", join("**" .* pkgs .* "**", ", ", ", and "))
        for entry in adv.affected
            println(io, "    * **$(entry.pkg)** at `[$(join('"'.*string.(entry.ranges).*'"', ", "))]`, matching `", join(keys(entry.source_mapping), "`, `", "`, and `"), "`")
        end
    end
    !isempty(advisories) && println(io)

    println(io, "BODY_EOF")
    seekstart(io)
    foreach(println, eachline(io)) # Also log to stdout
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

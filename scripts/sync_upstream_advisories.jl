#!/usr/bin/env julia

using AdvisoryDB: AdvisoryDB, NVD, EUVD, GitHub
using JSON3: JSON3
using TOML: TOML

function main()
    upstream_advisories = TOML.parsefile(joinpath(@__DIR__, "..", "upstream_advisories.toml"))
    n_published = 0
    n_updated = 0
    used_advisories = Set{String}()
    used_pkgs = Set{String}()
    packages_dir = joinpath(@__DIR__, "..", "packages", "General")
    for (advisory_id, applicable_packages) in upstream_advisories
        for (pkg, versioninfo) in applicable_packages
            versioninfo isa String && continue
            osv = AdvisoryDB.fetch_advisory(advisory_id, pkg => versioninfo)
            jlsec_id = AdvisoryDB.corresponding_jlsec_id(pkg, advisory_id, get(osv, :aliases, String[]))
            if isnothing(jlsec_id)
                AdvisoryDB.create!(pkg, osv)
                n_published += 1
                push!(used_pkgs, pkg)
                push!(used_advisories, advisory_id)
            else
                did_update = AdvisoryDB.update!(joinpath(packages_dir, pkg, jlsec_id * ".json"), osv)
                if did_update
                    n_updated += 1
                    push!(used_pkgs, pkg)
                    push!(used_advisories, advisory_id)
                end
            end
        end
    end
    n_synced = length(used_advisories)
    @info "published: $n_published"
    @info "updated: $n_updated"
    @info "for packages: $(join(used_pkgs, ", ", ", and "))"
    @info "and advisories: $(join(used_advisories, ", ", ", and "))"
    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "a+")
    publish_str = n_published > 0 ? "publish $n_published " : ""
    update_str = n_updated > 0 ? "$(n_published > 0 ? "and " : "")update $n_updated" : ""
    advisory_str = n_published + n_updated == 0 ? "no changes???" : n_published + n_updated == 1 ? "advisory" : "advisories"
    pkg_str = length(used_pkgs) <= 3 ? join(used_pkgs, ", ", ", and ") : "$(length(used_pkgs)) packages"
    println(io, "title=[automatic] sync $n_synced upstream advisories for $pkg_str: $publish_str$update_str $advisory_str")
    println(io, """
        body<<BODY_EOF
        This automated action used the upstream_advisories.toml file, fetching the current state of all listed advisories
        and importing them for the tagged packages.
        BODY_EOF
        """)
end

main()

using TOML

function main()
    package_components_path = joinpath(@__DIR__, "..", "package_components.toml")
    toml = isfile(package_components_path) ? TOML.parsefile(package_components_path) : Dict{String, Any}()

    project_info = TOML.parsefile(joinpath(@__DIR__, "..", "upstream_project_info.toml"))
    jll_metadata = TOML.parsefile(joinpath(@__DIR__, "..", "jll_metadata.toml"))
    jll_urls = [(jllname, jllversion, s["url"])
        for (jllname, jllinfo) in jll_metadata
            for (jllversion, verinfo) in jllinfo if haskey(verinfo, "sources")
                for s in verinfo["sources"] if haskey(s, "url")]
    jll_repos = [(jllname, jllversion, s["repo"], s["hash"])
        for (jllname, jllinfo) in jll_metadata
            for (jllversion, verinfo) in jllinfo if haskey(verinfo, "sources")
                for s in verinfo["sources"] if haskey(s, "repo")]
    info = Dict{String,Any}()
    info["skips"] = Tuple{String,String,String,String,String}[] # (package,version,project,newprojectversion,oldprojectversion) that had updates but were skipped because we already had a value set
    info["missings"] = Tuple{String,String,String}[] # (package,version,project) that stored a "*"
    info["updates"] = Tuple{String,String,String}[] # (package,version,project) that stored a non-missing value
    info["missing_reasons"] = Dict{Tuple{String,String,String}, String}()
    git_cache = Dict{String,String}()
    for (proj, projinfo) in project_info
        # Look for JLLs whose sources match this project
        url_regexes = get(projinfo, "url_regexes", String[])
        matches = Dict{Tuple{String,String},Any}()
        if !isempty(url_regexes)
            for (jllname, jllversion, url) in jll_urls
                ms = filter(!isnothing, match.(Regex.(url_regexes, "i"), url))
                isempty(ms) && continue
                # In most cases, there's only one upstream version. But this supports arrays for multiple captures
                # we also append to a previously-found match from a prior URL, if it's there
                captures = unique(vcat((x->x.captures[1]).(ms), get(matches, (jllname, jllversion), String[])))
                matches[(jllname, jllversion)] = length(captures) == 1 ? captures[1] : captures
            end
        end
        if haskey(projinfo, "repo")
            for (jllname, jllversion, repo, commit) in jll_repos
                if repo in vcat(get(projinfo, "repo", ""), get(projinfo, "repos", String[]))
                    dir = get!(git_cache, proj) do
                        tmp = mktempdir()
                        run(pipeline(`git clone $(projinfo["repo"]) $tmp`, stdout=Base.devnull, stderr=Base.devnull))
                        tmp
                    end
                    tag = cd(dir) do
                        t = try readchomp(`git tag --points-at $commit`) catch _ "" end
                        if isempty(t)
                            t = try readchomp(`git tag --points-at $commit\~`) catch _ "" end
                            !isempty(t) && @info "$proj: found tag at $commit~;\n\n$(readchomp(`git show --format=oneline $commit`))"
                        end
                        t
                    end
                    if isempty(tag)
                        info["missing_reasons"][(jllname, jllversion, proj)] = "commit $repo @ $commit is not tagged"
                        continue
                    end
                    # It can be challenging to parse a version number out of a tag; some options here include: v1.2.3 and PCRE2-1.2.3
                    # This strips all non-numeric prefixes with up to one digit as long as the digit is not followed by a period.
                    # and ignore everything after a newline
                    ver = strip(split(chopprefix(tag, r"^[^\d]*(?:\d[^\d.]+)?"), "\n", limit=2)[1])
                    @info "$proj: got version $(ver) from git tag $tag"
                    versions = unique(vcat(ver, get(matches, (jllname, jllversion), String[])))
                    matches[(jllname, jllversion)] = length(versions) == 1 ? versions[1] : versions
                end
            end
        end
        matching_jlls = unique(first.(keys(matches)))
        for jll in matching_jlls
            all_versions = keys(jll_metadata[jll])
            jll_toml = get!(toml, jll, Dict{String, Any}())
            for version in all_versions
                jll_toml_versioninfo = get!(jll_toml, version, Dict{String,Any}())
                if haskey(jll_toml_versioninfo, proj) && jll_toml_versioninfo[proj] != "*"
                    if haskey(matches, (jll, version)) && matches[(jll, version)] != jll_toml_versioninfo[proj]
                        # This is a mismatch that would otherwise be an update; report it
                        @info "skipping update to $jll@$version for $proj; found `$(matches[(jll, version)])` but `$(jll_toml_versioninfo[proj])` was already stored"
                        push!(info["skips"], (jll, version, proj, matches[(jll, version)], jll_toml_versioninfo[proj]))
                    end
                    continue
                end
                if !haskey(matches, (jll, version))
                    push!(info["missings"], (jll, version, proj))
                    if !haskey(info["missing_reasons"], (jll, version, proj))
                        # Gather the JLL's sources to report them
                        source_urls = (x->x[3]).(jll_urls[first.(jll_urls) .== jll .&& (x->x[2]).(jll_urls) .== version])
                        source_repo = (x->x[3]).(jll_repos[first.(jll_repos) .== jll .&& (x->x[2]).(jll_repos) .== version])
                        sources = vcat(source_urls, source_repo)
                        source_info_str = isempty(sources) ? "no sources" : "sources:\n    * " * join(sources, "\n    * ")
                        info["missing_reasons"][(jll, version, proj)] = "no matched sources; the JLL had $source_info_str"
                    end
                    @info "$proj: no version captured for $jll@$version; $(info["missing_reasons"][(jll, version, proj)])"
                else
                    push!(info["updates"], (jll, version, proj))
                end
                jll_toml_versioninfo[proj] = get(matches, (jll, version), "*")
            end
        end
    end

    io = open(get(ENV, "GITHUB_OUTPUT", tempname()), "w")
    println(io, "exact=", isempty(info["missings"]))
    updated_packages = unique(first.(info["updates"]))
    n_pkgs = length(updated_packages)
    pkg_str = string(n_pkgs == 1 ? "package" : "packages", n_pkgs <= 3 ? ": " * join(updated_packages, ", ", ", and ") : "")
    missing_str = isempty(info["missings"]) ? "" : string(
        "### Failed to find versions for ", length(info["missings"]), length(info["missings"]) == 1 ? " entry" : " entries", "\n\n* ",
        join([string(pkg, "@", pkgver, ", ", proj, ": ", info["missing_reasons"][(pkg, pkgver, proj)]) for (pkg,pkgver,proj) in info["missings"]], "\n* "),
        "\n\n Address these by manually replacing the `\"*\"` entries with either `[]` (to confirm that project does not exist) or the appropriate upstream version number.")
    skip_str = isempty(info["skips"]) ? "" : string(
        "<details><summary>", length(info["skips"]), "updates were skipped because their values were already set</summary>\n\n",
        "* ", join([string(pkg, "@", pkgver, " ", proj, ": found ", newver, "; have ", oldver, " set")], "\n* "),
        "\n\n</details>\n")
    println(io, "title=[automatic] update upstream component versions for $n_pkgs $pkg_str")
    println(io, """
        body<<BODY_EOF
        This automated action used `upstream_project_info.toml` to match upstream projects against the JLL sources reported in `jll_metadata.toml`.

        $missing_str$skip_str
        BODY_EOF
        """)

    open(package_components_path, "w") do f
        println("""
            # This file contains the mapping between a Julia package version and the upstream project(s) it directly provides.
            # The keys are package name and version, pointing to a table that maps from an included upstream project name
            # (as defined in upstream_project_info.toml) and its version(s). Typically versions can simply be a string, but
            # in rare cases packages may include more than one copy of an upstream project at differing versions. In such cases,
            # an array of multiple versions can be specified.
            #
            # This file is automatically updated, based upon the sources recorded in jll_metadata.toml; comments are not preserved.
            # The automatic update script (`scripts/update_package_components.jl`) assumes that if a project is included at _some_
            # package version, then it should have definitions (perhaps manually entered) at all versions. To explicitly state that
            # the project is not incorporated and prevent such suggestions, use an empty array.""")
        TOML.print(f, toml, sorted=true,
            by=x->something(tryparse(VersionNumber, x), x),
            inline_tables=IdSet{Dict{String,Any}}(vertable for jlltable in values(toml) for vertable in values(jlltable) if length(values(vertable)) <= 2))
    end
    return toml
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

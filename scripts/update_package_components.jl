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
    git_cache = Dict{String,String}()
    for (proj, info) in project_info
        # Look for JLLs whose sources match this project
        url_regexes = get(info, "url_regexes", String[])
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
        if haskey(info, "repo")
            for (jllname, jllversion, repo, commit) in jll_repos
                if repo == get(info, "repo", "")
                    dir = get!(git_cache, proj) do
                        tmp = mktempdir()
                        run(pipeline(`git clone $repo $tmp`, stdout=Base.devnull, stderr=Base.devnull))
                        tmp
                    end
                    tag = cd(dir) do
                        readchomp(`git tag --points-at $commit`)
                    end
                    if isempty(tag)
                        @info "Commit $repo @ $commit is not a tag"
                        continue
                    end
                    # It can be challenging to parse a version number out of a tag; some options here include: v1.2.3 and PCRE2-1.2.3
                    # This strips all non-numeric prefixes with up to one digit as long as the digit is not immediately followed by a period.
                    ver = chopprefix(tag, r"^[^\d]*(?:\d[^\d.]+)?")
                    @info "got version $(ver) from git tag $tag"
                    versions = unique(vcat(ver, get(matches, (jllname, jllversion), String[])))
                    matches[(jllname, jllversion)] = length(versions) == 1 ? versions[1] : versions
                end
            end
        end
        matching_jlls = unique(first.(keys(matches)))
        for jll in matching_jlls
            matching_versions = last.(filter(x->(first(x) == jll), keys(matches)))
            all_versions = keys(jll_metadata[jll])
            for missing_version in setdiff(all_versions, matching_versions)
                source_urls = (x->x[3]).(jll_urls[first.(jll_urls) .== jll .&& (x->x[2]).(jll_urls) .== missing_version])
                source_repo = (x->x[3]).(jll_repos[first.(jll_repos) .== jll .&& (x->x[2]).(jll_repos) .== missing_version])
                url_str = isempty(source_urls) ? "" : "; Source urls:\n    " * join(source_urls, "\n    ")
                @info "$proj: no versions captured for $jll@$missing_version$url_str" source_repo
            end
            jll_toml = get!(toml, jll, Dict{String, Any}())
            for version in all_versions
                jll_toml_versioninfo = get!(jll_toml, version, Dict{String,Any}())
                haskey(jll_toml_versioninfo, proj) && jll_toml_versioninfo[proj] != "*" && continue
                jll_toml_versioninfo[proj] = get(matches, (jll, version), "*")
            end
        end
    end

    open(package_components_path, "w") do f
        TOML.print(f, toml, sorted=true,
            by=x->something(tryparse(VersionNumber, x), x),
            inline_tables=IdSet{Dict{String,Any}}(vertable for jlltable in values(toml) for vertable in values(jlltable) if length(values(vertable)) <= 2))
    end
    return toml
end

if abspath(PROGRAM_FILE) == @__FILE__
    update_metadata()
end

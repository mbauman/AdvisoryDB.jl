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
    for (proj, info) in project_info
        # Look for JLLs whose sources match this project
        url_regexes = get(info, "url_regexes", String[])
        matches = Dict{Tuple{String,String},Any}()
        for (jllname, jllversion, url) in jll_urls
            ms = filter(!isnothing, match.(Regex.(url_regexes, "i"), url))
            isempty(ms) && continue
            # In most cases, there's only one upstream version. But this supports arrays for multiple captures
            # we also append to a previously-found match from a prior URL, if it's there
            captures = unique(vcat((x->x.captures[1]).(ms), get(matches, (jllname, jllversion), String[])))
            matches[(jllname, jllversion)] = length(captures) == 1 ? captures[1] : captures
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

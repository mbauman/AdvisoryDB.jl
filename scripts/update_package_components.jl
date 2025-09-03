using TOML

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
    if haskey(info, "regexes")
        for regex in info["regexes"]

        end
    end
end
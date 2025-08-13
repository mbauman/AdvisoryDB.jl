#!/usr/bin/env julia
#
# USAGE: fetch_github_advisories OUT_DIRECTORY [optional repo]

using AdvisoryDB: GitHub, JSON3

println("Starting GitHub Security Advisory fetcher...")
path = isempty(ARGS) ? mktempdir() : ARGS[1]

all_advisories = if length(ARGS) > 1 && !isempty(ARGS[2])
    # Fetch all advisories for a single repo (for manual triggering)
    GitHub.fetch_repo_advisories(ARGS[2])
else
    GitHub.fetch_advisories()
end
n = length(all_advisories)
println("Found $n total GHSA$(n==1 ? "" : "s")")
advisories = GitHub.filter_julia_advisories(all_advisories)

if isempty(advisories)
    println("No Julia ecosystem advisories found")
    exit()
end

n = length(advisories)
println("Found $n Julia-related GHSA$(n==1 ? "" : "s")")

mkpath(path)
for advisory in advisories
    osv = GitHub.convert_to_osv(advisory)
    p = joinpath(path, string(advisory.ghsa_id, ".json"))
    JSON3.write(p, osv)
    println(" - created $p")
end

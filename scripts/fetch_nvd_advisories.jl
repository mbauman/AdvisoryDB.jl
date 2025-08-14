#!/usr/bin/env julia

using AdvisoryDB: NVD

println("Starting NVD vulnerability fetcher...")
path = isempty(ARGS) ? mktempdir() : ARGS[1]

all_vulnerabilities = if length(ARGS) > 1 && !isempty(ARGS[2])
    # Fetch all advisories for a single repo (for manual triggering)
    if startswith(lowercase(ARGS[2]), "cve")
        NVD.fetch_cve(ARGS[2])
    else
        error("unsupported argument to workflow")
    end
else
    NVD.fetch_nvd_vulnerabilities()
end

advisories = NVD.filter_julia_vulnerabilities(all_vulnerabilities)

if isempty(advisories)
    println("No Julia-related vulnerabilities found in the specified time period.")
    exit()
end

n = length(advisories)
println("Found $n Julia-related CVE$(n==1 ? "" : "s") on NVD")

mkpath(path)
for advisory in advisories
    osv = NVD.convert_to_osv(advisory)
    p = joinpath(path, string(osv.id, ".json"))
    JSON3.write(p, osv)
    println(" - created $p")
end

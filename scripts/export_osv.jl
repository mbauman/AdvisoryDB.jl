using AdvisoryDB: AdvisoryDB
using JSON3: JSON3
using Dates: Dates

function main()
    published_advisories_path = joinpath(@__DIR__, "..", "advisories", "published")
    output = joinpath(@__DIR__, "..", "osv")
    for (root, _, files) in walkdir(published_advisories_path), file in files
        advisory = AdvisoryDB.parsefile(joinpath(root, file))
        osv = AdvisoryDB.to_osv_dict(advisory)
        outpath = joinpath(output, string(Dates.year(advisory.published)))
        mkpath(outpath)
        open(joinpath(outpath, advisory.id * ".json"), "w") do io
            JSON3.write(io, osv)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

#!/usr/bin/env julia

using AdvisoryDB: GitHub

function main()
    try
        println("Starting GitHub Security Advisory fetcher...")
        if !isempty(ARGS) && !isempty(ARGS[1])
            # Fetch all advisories for a single repo (for manual triggering)
            advisories = GitHub.fetch_repo_advisories(ARGS[1])
        else
            all_advisories = GitHub.fetch_advisories()
            advisories = GitHub.filter_julia_advisories(all_advisories)
        end

        if isempty(advisories)
            println("No Julia ecosystem advisories found in the specified time period.")
            return
        end

        GitHub.write_advisory_files(advisories)
        println("Process completed successfully!")

    catch e
        println("Error: $e")
        exit(1)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

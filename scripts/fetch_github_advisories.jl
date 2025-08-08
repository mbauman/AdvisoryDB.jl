#!/usr/bin/env julia

using AdvisoryDB: GitHub

if abspath(PROGRAM_FILE) == @__FILE__
    GitHub.main()
end

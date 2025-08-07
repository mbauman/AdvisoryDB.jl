#!/usr/bin/env julia

using AdvisoryDB: NVD

if abspath(PROGRAM_FILE) == @__FILE__
    NVD.main()
end

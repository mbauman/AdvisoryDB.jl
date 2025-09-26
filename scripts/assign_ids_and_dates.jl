using SecurityAdvisories
using Dates: Dates, DateTime
using TimeZones: TimeZones, ZonedDateTime

function main()
    all_advisories_path = joinpath(@__DIR__, "..", "advisories")
    published_advisories_path = joinpath(@__DIR__, "..", "advisories", "published")

    # First look through all advisories for the latest identifier
    year = Dates.year(Dates.now(Dates.UTC))
    last_id = 0
    for (root, _, files) in walkdir(all_advisories_path), file in files
        SecurityAdvisories.is_jlsec_advisory_path(joinpath(root, file)) || continue
        prefix = string(SecurityAdvisories.PREFIX, "-", year, "-")
        startswith(file, prefix) || continue
        last_id = max(last_id, something(tryparse(Int, chopprefix(chopsuffix(file, ".md"), prefix)), 0))
    end

    # Then go through the published advisories and ensure all IDs are assigned
    # and that the dates accurately match the commit dates
    n_updated = 0
    now = Dates.now(Dates.UTC)
    for (root, _, files) in walkdir(published_advisories_path), file in files
        path = joinpath(root, file)
        SecurityAdvisories.is_jlsec_advisory_path(path) || continue
        advisory = SecurityAdvisories.parsefile(path)
        updated = false
        if startswith(advisory.id, string(SecurityAdvisories.PREFIX, "-0000-"))
            last_id += 1
            advisory.id = string(SecurityAdvisories.PREFIX, "-", year, "-", last_id)
            updated = true
            newpath = joinpath(root, string(advisory.id, ".md"))
            @info "moving $file to $(advisory.id).md"
            success(`git mv $path $newpath`) || run(`mv $path $newpath`)
            path = newpath
            modified = published = now
        else
            git_modified = readchomp(`git log -1 --format="%cd" --date=iso-strict -- $path`)
            modified = isempty(git_modified) ? now : DateTime(ZonedDateTime(git_modified), Dates.UTC)
            git_published = readchomp(`git log -1 --format="%cd" --date=iso-strict --diff-filter=A -- $path`)
            published = isempty(git_published) ? modified : DateTime(ZonedDateTime(git_published), Dates.UTC)
        end
        if something(advisory.withdrawn, typemin(DateTime)) > advisory.modified
            # If the withdrawn date is _after_ the previously stored modified time, then it's a new modification
            # The effective time of the widthdraw will be upon publication to this repo — the new modified time
            @info "$file: advisory is newly withdrawn"
            advisory.withdrawn = now
            advisory.modified = now
            updated = true
        end
        if abs(advisory.modified - modified) > Dates.Minute(5)
            @info "$file: Computed modified ($modified) is far away from existing $(advisory.modified)"
            advisory.modified = now
            updated = true
        end
        if isnothing(advisory.published) || abs(advisory.published - published) > Dates.Minute(5)
            @info "$file: Computed published ($published) is far away from existing $(advisory.published)"
            advisory.published = now
            updated = true
        end

        if updated
            # TODO: we could do better by applying a git diff that only includes the semantically meaningful parts
            open(path, "w") do io
                print(io, advisory)
            end
            n_updated += 1
        end
    end

    @info "updated $n_updated advisories"
    io = haskey(ENV, "GITHUB_OUTPUT") ? open(ENV["GITHUB_OUTPUT"], "w") : stdout
    println(io, "changes=", n_updated > 0)
    println(io, "title=[automated] assign id/timestamp $n_updated advisories")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

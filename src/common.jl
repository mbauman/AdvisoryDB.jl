using JSON3: JSON3

const ALL_PKGS = Pair{String,String}[]
function get_uuids_in_general(pkgname)
    if isempty(ALL_PKGS)
        # This should really use Pkg APIs, but they are non-trivial and hang on GitHub Actions
        registry = TOML.parsefile(download("https://github.com/JuliaRegistries/General/raw/refs/heads/master/Registry.toml"))
        append!(ALL_PKGS, sort!([info["name"]=>uuid for (uuid, info) in registry["packages"]]))
    end
    idxs = searchsorted(ALL_PKGS, pkgname=>"", by=first)
    return last.(getindex.((ALL_PKGS,), idxs))
end

function get_packages(osv)
    pkgs = Tuple{String,String}[]
    id = osv.id
    println("Looking for Julia packages in $id")
    if haskey(advisory, :vulnerabilities) && !isempty(advisory.vulnerabilities)
        for vuln in advisory.vulnerabilities
            if haskey(vuln, :package) && haskey(vuln.package, :name) && haskey(vuln.package, :ecosystem)
                lowercase(string(vuln.package.ecosystem)) == "julia" || continue
                pkgname = chopsuffix(strip(vuln.package.name), ".jl")
                println(" - looking for $pkgname in the General registry")
                uuids = get_uuids_in_general(pkgname)
                if length(uuids) != 1
                    println(" ⨯ found $(length(uuids)) UUIDs for $pkgname")
                    url = haskey(advisory, :html_url) ? advisory.html_url : ""
                    create_issue(ENV["GITHUB_REPOSITORY"],
                        title="Failed to find a registered $(pkgname) for $ghsa_id",
                        body="""
                            The advisory [$ghsa_id]($url) names **$pkgname** as an affected product from the
                            Julia ecosystem, but $(isempty(uuids) ? "no" : "more than one") match was found
                            in the General registry.

                            The complete advisory is:

                            ```json
                            $(sprint(JSON3.pretty, advisory))
                            ```
                            """
                    )
                else
                    println(" - found $pkgname => $(only(uuids))")
                    push!(pkgs, (pkgname, only(uuids)))
                end
            end
        end
    end
    return pkgs
end

function import_osv_files(path)
    packages_dir = "packages/General"
    for filename in readdir(path)
        endswith(filename, ".json") || continue

        osv_data = JSON3.read(joinpath(path, filename))

        for (package, uuid) in get_packages(osv_data)
            package_dir = joinpath(packages_dir, package)
            mkpath(package_dir)

            filename = "$(osv_data.id).json"
            filepath = joinpath(package_dir, filename)

            println("Writing advisory: $filepath")
            open(filepath, "w") do f
                JSON3.pretty(f, osv_data)
            end
        end
    end

    println("Completed writing $(length(advisories)) advisories to disk")
end

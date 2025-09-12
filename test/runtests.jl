using AdvisoryDB, Test

using AdvisoryDB.VersionStrings: VersionString as V
@testset "VersionString comparisons" begin
    @test V("1.0.3") < V("1.0.10")
    @test V("1.0.3-rc2") < V("1.0.3-rc10")
    @test V("2.0.3-rc2") > V("1.0.3-rc10")
    @test V("1") < V("1.0.1")
    @test V("1.2.3-") < V("1.2.3")
    @test V("1.2.3-rc1") < V("1.2.3")
    @test !(V("1.2.3") < V("1.2.3"))
    @test V("1.1.1") < V("1.1.1c")
    @test V("01") < V("1")
    @test V("01") < V("1.0")
    @test V("1.2.03") < V("1.2.3")
    @test V("1.2.03") != V("1.2.3")
    @test V("1.2.3") > V("1.2.03")
    @test V("1.2.03") < V("1.2.3-")
    @test V("1.2.3-") > V("1.2.03")
end

using AdvisoryDB: VersionRange as VR, merge_ranges
@testset "VersionRange merging" begin
    @test merge_ranges(VR.(["1 < 2", "2 < 3", "3 < 4"])) == [VR("1 < 4")]
    @test merge_ranges(VR.(["1 < 2", "2 <= 4", "3 < 4"])) == [VR("1 <= 4")]
    @test merge_ranges(VR.(["1 < 2", "2 <= 4", "3 < 4", "3 < 5"])) == [VR("1 < 5")]
    @test merge_ranges(VR.(["1 < 2", "> 2, <= 5", "3 < 5"])) == [VR("1 < 2"), VR(">2, <=5")]

    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "2 < 3", "3 < 4"])) == [VR{VersionNumber}("1 < 4")]
    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "2 <= 4", "3 < 4"])) == [VR{VersionNumber}("1 <= 4")]
    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "2 <= 4", "3 < 4", "3 < 5"])) == [VR{VersionNumber}("1 < 5")]
    @test merge_ranges(VR{VersionNumber}.(["1 < 2", "> 2, <= 5", "3 < 5"])) == [VR{VersionNumber}("1 < 2"), VR{VersionNumber}(">2, <=5")]
end

## Matching; this should ideally be more isolated from the state of package_components.toml
@testset "CVE-2021-4048 — applicable packages and ranges" begin
    desc = "An out-of-bounds read flaw was found in the CLARRV, DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0, as also used in OpenBLAS before version 0.3.18. Specially crafted inputs passed to these functions could cause an application using lapack to crash or possibly disclose portions of its memory."
    vpv = [("lapack_project", "lapack", "<= 3.10.0"), ("openblas_project", "openblas", "< 0.3.18"), ("julialang", "julia", "<= 1.6.3"), ("julialang", "julia", "= 1.7.0-beta1"), ("julialang", "julia", "= 1.7.0-beta2"), ("julialang", "julia", "= 1.7.0-beta3"), ("julialang", "julia", "= 1.7.0-beta4"), ("julialang", "julia", "= 1.7.0-rc1"), ("redhat", "ceph_storage", "= 2.0"), ("redhat", "ceph_storage", "= 3.0"), ("redhat", "ceph_storage", "= 4.0"), ("redhat", "ceph_storage", "= 5.0"), ("redhat", "openshift_container_storage", "= 4.0"), ("redhat", "openshift_data_foundation", "= 4.0"), ("redhat", "enterprise_linux", "= 8.0"), ("fedoraproject", "fedora", "= 34"), ("fedoraproject", "fedora", "= 35")]

    matches = AdvisoryDB.related_julia_packages(desc, vpv)
    @test "julia" ∉ first.(matches)
    @test "OpenBLAS_jll" in first.(matches)
    @test "OpenBLAS32_jll" in first.(matches)
    @test "OpenBLASHighCoreCount_jll" in first.(matches)

    @test !any(contains("∞"), (x->x[2])(only(matches[first.(matches) .== "OpenBLASHighCoreCount_jll"])))
end

using AdvisoryDB: convert_versions, VersionRange
@testset "version conversions" begin
    @test isempty(convert_versions(["1.2.3" => "3.4.5"], VersionRange("< 3.4.5")))
    @test only(convert_versions(["1.2.3" => "3.4.5"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("*")
    @test only(convert_versions(["1.2.2" => "3.4.4", "1.2.3" => "3.4.5", "1.2.4" => "3.4.6"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => "*", "1.2.3" => "3.4.5", "1.2.4" => "3.4.6"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("< 1.2.4")
    @test only(convert_versions(["1.2.2" => "3.4.4", "1.2.3" => "3.4.5", "1.2.4" => "*"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3")
    @test only(convert_versions(["1.2.2" => [], "1.2.3" => "3.4.5", "1.2.4" => []], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.4","3.4.5"], "1.2.3" => "3.4.5", "1.2.4" => []], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("< 1.2.4")

    @test only(convert_versions(["1.2.2" => "3.4.4", "1.2.3" => "*", "1.2.4" => "3.4.6"], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.6","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.5"], "1.2.3" => "*", "1.2.4" => ["3.4.6","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}("< 1.2.4")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.5","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.4","3.4.5"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3")
    @test only(convert_versions(["1.2.2" => ["3.4.3","3.4.4"], "1.2.3" => "*", "1.2.4" => ["3.4.4","3.4.7"]], VersionRange("= 3.4.5"))) == VersionRange{VersionNumber}(">= 1.2.3, < 1.2.4")
end

# Specific support for re-interpreting GitHub's patched field:
@testset "GitHub version extraction" begin
    # From GHSA-543v-gj2c-r3ch
    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "activemodel", :ecosystem => "rubygems"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0, <= 4.1.14.0", :first_patched_version => "4.1.14.1"), Dict(:package => Dict(:name => "activemodel", :ecosystem => "rubygems"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.2.0, <= 4.2.5.0", :first_patched_version => "4.2.5.1")])
    vpv = GitHub.vendor_product_versions(vuln)
    @test length(vpv) == 2
    @test vpv[1] == ("rubygems", "activemodel", ">= 4.1.0, < 4.1.14.1")
    @test vpv[2] == ("rubygems", "activemodel", ">= 4.2.0, < 4.2.5.1")

    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0, <= 4.1.14.0", :first_patched_version => "4.1.14.1"), Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.2.0, <= 4.2.5.0", :first_patched_version => "4.2.5.1")])
    @test_throws "invalid version" GitHub.vendor_product_versions(vuln)

    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0, <= 4.1.14", :first_patched_version => "4.1.15"), Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.2.0, <= 4.2.5", :first_patched_version => "4.2.6")])
    vpv = GitHub.vendor_product_versions(vuln)
    @test length(vpv) == 2
    @test vpv[1] == ("Julia", "ActiveInference", ">= 4.1.0, < 4.1.15")
    @test vpv[2] == ("Julia", "ActiveInference", ">= 4.2.0, < 4.2.6")

    vuln = Dict(:vulnerabilities => [Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => ">= 4.1.0", :first_patched_version => "4.1.15"), Dict(:package => Dict(:name => "ActiveInference", :ecosystem => "Julia"), :vulnerable_functions => Any[], :vulnerable_version_range => "<= 4.2.5", :first_patched_version => "4.2.6")])
    vpv = GitHub.vendor_product_versions(vuln)
    @test length(vpv) == 2
    @test vpv[1] == ("Julia", "ActiveInference", ">= 4.1.0, < 4.1.15")
    @test vpv[2] == ("Julia", "ActiveInference", "< 4.2.6")
end

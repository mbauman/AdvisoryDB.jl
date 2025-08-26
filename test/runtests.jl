using AdvisoryDB, Test

using AdvisoryDB: VersionIshNumber as V
@testset "VersionIshNumber comparisons" begin
    @test V("1.0.3") < V("1.0.10")
    @test V("1.0.3-rc2") < V("1.0.3-rc10")
    @test V("2.0.3-rc2") > V("1.0.3-rc10")
    @test V("1") < V("1.0.1")
    @test V("1.2.3-") < V("1.2.3")
    @test V("1.2.3-rc1") < V("1.2.3")
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

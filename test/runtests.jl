using AdventOfCode
using Test

@testset "AdventOfCode.jl" begin
    # Test each year that has solutions
    for year in AdventOfCode.YEARS
        year_test_file = joinpath(@__DIR__, string(year), "runtests.jl")
        if isfile(year_test_file)
            include(year_test_file)
        end
    end
end
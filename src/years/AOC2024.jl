module AOC2024

using ..AdventOfCode: readInput

# Define a module for each day
module Day01
using ...AdventOfCode: readInput
include("../2024/day01.jl")
end

module Day02
using ...AdventOfCode: readInput
include("../2024/day02.jl")
end

module Day03
using ...AdventOfCode: readInput
include("../2024/day03.jl")
end

module Day04
using ...AdventOfCode: readInput
include("../2024/day04.jl")
end

module Day05
using ...AdventOfCode: readInput
include("../2024/day05.jl")
end

module Day06
using ...AdventOfCode: readInput
include("../2024/day06.jl")
end

module Day07
using ...AdventOfCode: readInput
include("../2024/day07.jl")
end

module Day08
using ...AdventOfCode: readInput
include("../2024/day08.jl")
end

module Day09
using ...AdventOfCode: readInput
include("../2024/day09.jl")
end

module Day10
using ...AdventOfCode: readInput
include("../2024/day10.jl")
end

module Day11
using ...AdventOfCode: readInput
include("../2024/day11.jl")
end

module Day12
using ...AdventOfCode: readInput
include("../2024/day12.jl")
end

module Day13
using ...AdventOfCode: readInput
include("../2024/day13.jl")
end

module Day14
using ...AdventOfCode: readInput
include("../2024/day14.jl")
end

module Day15
using ...AdventOfCode: readInput
include("../2024/day15.jl")
end

module Day16
using ...AdventOfCode: readInput
include("../2024/day16.jl")
end

module Day17
using ...AdventOfCode: readInput
include("../2024/day17.jl")
end

module Day18
using ...AdventOfCode: readInput
include("../2024/day18.jl")
end

module Day19
using ...AdventOfCode: readInput
include("../2024/day19.jl")
end

module Day20
using ...AdventOfCode: readInput
include("../2024/day20.jl")
end

module Day21
using ...AdventOfCode: readInput
include("../2024/day21.jl")
end

module Day22
using ...AdventOfCode: readInput
include("../2024/day22.jl")
end

module Day23
using ...AdventOfCode: readInput
include("../2024/day23.jl")
end

module Day24
using ...AdventOfCode: readInput
include("../2024/day24.jl")
end

module Day25
using ...AdventOfCode: readInput
include("../2024/day25.jl")
end

# Define convenience functions (e.g., day01(input), day02(input), etc.)
for day in 1:25
    day_str = lpad(day, 2, "0")
    day_sym = Symbol("day$day_str")  # e.g., :day01
    day_module = Symbol("Day$day_str")  # e.g., :Day01
    day_file = joinpath(@__DIR__, "..", "2024", "day$day_str.jl")
    if isfile(day_file)
        default_file = joinpath(@__DIR__, "..", "..", "data", "2024", "day$day_str.txt")
        @eval function $day_sym(input::String=readInput($default_file))
            $day_module.$day_sym(input)
        end
        @eval export $day_sym
    end
end

end # module AOC2024
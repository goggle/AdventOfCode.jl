module AOC2022

using ..AdventOfCode: readInput

# Define a module for each day
module Day01
using ...AdventOfCode: readInput
include("../2022/day01.jl")
end

module Day02
using ...AdventOfCode: readInput
include("../2022/day02.jl")
end

module Day03
using ...AdventOfCode: readInput
include("../2022/day03.jl")
end

module Day04
using ...AdventOfCode: readInput
include("../2022/day04.jl")
end

module Day05
using ...AdventOfCode: readInput
include("../2022/day05.jl")
end

module Day06
using ...AdventOfCode: readInput
include("../2022/day06.jl")
end

module Day07
using ...AdventOfCode: readInput
include("../2022/day07.jl")
end

module Day08
using ...AdventOfCode: readInput
include("../2022/day08.jl")
end

module Day09
using ...AdventOfCode: readInput
include("../2022/day09.jl")
end

module Day10
using ...AdventOfCode: readInput, generate_image
include("../2022/day10.jl")
end

module Day11
using ...AdventOfCode: readInput
include("../2022/day11.jl")
end

module Day12
using ...AdventOfCode: readInput
include("../2022/day12.jl")
end

module Day13
using ...AdventOfCode: readInput
include("../2022/day13.jl")
end

module Day14
using ...AdventOfCode: readInput
include("../2022/day14.jl")
end

module Day15
using ...AdventOfCode: readInput
include("../2022/day15.jl")
end

module Day16
using ...AdventOfCode: readInput
include("../2022/day16.jl")
end

module Day17
using ...AdventOfCode: readInput
include("../2022/day17.jl")
end

module Day18
using ...AdventOfCode: readInput
include("../2022/day18.jl")
end

module Day19
using ...AdventOfCode: readInput
include("../2022/day19.jl")
end

module Day20
using ...AdventOfCode: readInput
include("../2022/day20.jl")
end

module Day21
using ...AdventOfCode: readInput
include("../2022/day21.jl")
end

module Day22
using ...AdventOfCode: readInput
include("../2022/day22.jl")
end

module Day23
using ...AdventOfCode: readInput
include("../2022/day23.jl")
end

module Day24
using ...AdventOfCode: readInput
include("../2022/day24.jl")
end

module Day25
using ...AdventOfCode: readInput
include("../2022/day25.jl")
end

# Define convenience functions (e.g., day01(input), day02(input), etc.)
for day in 1:25
    day_str = lpad(day, 2, "0")
    day_sym = Symbol("day$day_str")  # e.g., :day01
    day_module = Symbol("Day$day_str")  # e.g., :Day01
    day_file = joinpath(@__DIR__, "..", "2022", "day$day_str.jl")
    if isfile(day_file)
        default_file = joinpath(@__DIR__, "..", "..", "data", "2022", "day$day_str.txt")
        @eval function $day_sym(input::String=readInput($default_file))
            $day_module.$day_sym(input)
        end
        @eval export $day_sym
    end
end

end # module AOC2022
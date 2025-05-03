module AdventOfCode

using BenchmarkTools
using Printf

# Load utility functions
include(joinpath(@__DIR__, "utils.jl"))

# Years we have solutions for
const YEARS = 2020:2024
const DAYS_PER_YEAR = 1:25

# Include year-specific modules
for year in YEARS
    include(joinpath(@__DIR__, "years", "AOC$year.jl"))
end

# Export each yearly module
for year in YEARS
    @eval begin
        import .$(Symbol("AOC$year"))
        export $(Symbol("AOC$year"))
    end
end

# Convenience function to run a specific day from a specific year
function run(year::Int, day::Int; input=nothing)
    @assert year in YEARS "Year $year not available"
    @assert day in DAYS_PER_YEAR "Day $day not available"
    
    yearmod = getproperty(AdventOfCode, Symbol("AOC$year"))
    day_fn = getproperty(yearmod, Symbol("day$(lpad(day, 2, "0"))"))
    
    if isnothing(input)
        input = readInput(year, day)
    end
    
    return day_fn(input)
end

# Benchmark a specific day
function benchmark(year::Int, day::Int)
    @assert year in YEARS "Year $year not available"
    @assert day in DAYS_PER_YEAR "Day $day not available"
    
    yearmod = getproperty(AdventOfCode, Symbol("AOC$year"))
    day_fn = getproperty(yearmod, Symbol("day$(lpad(day, 2, "0"))"))
    
    input = readInput(year, day)
    result = @benchmark $day_fn($input)
    
    return (year=year, day=day, time=time(result), memory=memory(result))
end

# Benchmark all days for a specific year
function benchmark(year::Int)
    @assert year in YEARS "Year $year not available"
    
    results = []
    for day in DAYS_PER_YEAR
        try
            push!(results, benchmark(year, day))
        catch e
            @warn "Failed to benchmark year $year day $day: $e"
        end
    end
    
    return results
end

# Benchmark all solved problems
function benchmark()
    results = []
    for year in YEARS
        year_results = benchmark(year)
        append!(results, year_results)
    end
    
    return results
end

# Convert benchmark results to markdown table
function to_markdown_table(bresults)
    header = "| Year | Day | Time | Allocated memory |\n" *
             "|-----:|----:|-----:|-----------------:|"
    lines = [header]
    for r in bresults
        y = r.year
        d = r.day
        t = BenchmarkTools.prettytime(r.time)
        m = BenchmarkTools.prettymemory(r.memory)
        push!(lines, "| $y | $d | $t | $m |")
    end
    return join(lines, "\n")
end

# Re-export utility functions 
export readInput, generate_image, run, benchmark, to_markdown_table

end # module AdventOfCode
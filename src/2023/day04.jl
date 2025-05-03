function day04(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "day04.txt")))
    winning_numbers, my_numbers = parse_input(input)
    p1 = sum(eval_points(length(intersect(w, m))) for (w, m) ∈ zip(winning_numbers, my_numbers))
    return [p1, part2(winning_numbers, my_numbers)]
end

function parse_input(input::AbstractString)
    winning_numbers, my_numbers = Vector{Vector{Int}}(), Vector{Vector{Int}}()
    for line ∈ eachsplit(rstrip(input), "\n")
        _, w, m = split(line, x -> x ∈ ('|', ':'))
        push!(winning_numbers, parse.(Int, split(strip(w), r"\s+")))
        push!(my_numbers, parse.(Int, split(strip(m), r"\s+")))
    end
    return winning_numbers, my_numbers
end

eval_points(nwins::Int) = nwins > 0 ? 2^(nwins - 1) : 0

function part2(winning_numbers::Vector{Vector{Int}}, my_numbers::Vector{Vector{Int}})
    ncards = ones(Int, length(winning_numbers))
    for (i, (w, m)) ∈ enumerate(zip(winning_numbers, my_numbers))
        ncards[i+1:i+length(intersect(w, m))] .+= ncards[i]
    end
    return ncards |> sum
end

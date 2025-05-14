using LinearAlgebra

function day13(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "2024", "day13.txt")))
    data = parse_input(input)
    solve(data)
end

function parse_input(input::String)
    data = Vector{NTuple{6, Int}}([])
    r1 = r"Button\s*[A-B]:\s*X\+(\d+),\sY\+(\d+)"
    r2 = r"Prize:\s*X=(\d+),\s*Y=(\d+)"
    for block ∈ split(input, "\n\n")
        lines = split(block, "\n")
        m1 = match(r1, lines[1])
        !isnothing(m1) || error("Regex r1 match failed for line: $(lines[1])")
        !isnothing(m1.captures[1]) || error("Capture group 1 is Nothing in r1 match: $(lines[1])")
        !isnothing(m1.captures[2]) || error("Capture group 2 is Nothing in r1 match: $(lines[1])")
        ax, ay = parse.(Int, [m1.captures[1]::SubString{String}, m1.captures[2]::SubString{String}])

        m2 = match(r1, lines[2])
        !isnothing(m2) || error("Regex r1 match failed for line: $(lines[2])")
        !isnothing(m2.captures[1]) || error("Capture group 1 is Nothing in r1 match: $(lines[2])")
        !isnothing(m2.captures[2]) || error("Capture group 2 is Nothing in r1 match: $(lines[2])")
        bx, by = parse.(Int, [m2.captures[1]::SubString{String}, m2.captures[2]::SubString{String}])

        m3 = match(r2, lines[3])
        !isnothing(m3) || error("Regex r2 match failed for line: $(lines[3])")
        !isnothing(m3.captures[1]) || error("Capture group 1 is Nothing in r2 match: $(lines[3])")
        !isnothing(m3.captures[2]) || error("Capture group 2 is Nothing in r2 match: $(lines[3])")
        x, y = parse.(Int, [m3.captures[1]::SubString{String}, m3.captures[2]::SubString{String}])

        push!(data, (ax, ay, bx, by, x, y))
    end
    return data
end

function solve(data)
    p = [0, 0]
    for elem ∈ data
        A = [elem[1] elem[3]; elem[2] elem[4]]
        bs = [[elem[5], elem[6]], [elem[5] + 10_000_000_000_000, elem[6] + 10_000_000_000_000]]
        for (i, b) ∈ enumerate(bs)
            x = round.(Int, A\b)
            if A * x == b
                p[i] += 3 * x[1] + x[2]
            end
        end
    end
    return p
end
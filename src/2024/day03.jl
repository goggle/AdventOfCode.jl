using IterTools

function day03(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "2024", "day03.txt")))
    reg = r"mul\(([0-9]{1,3}),([0-9]{1,3})\)"
    occurences = findall(reg, input)
    p1 = 0
    for occ ∈ occurences
        m = match(reg, input[occ])
        !isnothing(m) || error("Regex match failed for mul pattern at position $occ")
        !isnothing(m.captures[1]) || error("Capture group 1 is Nothing in mul match at position $occ")
        !isnothing(m.captures[2]) || error("Capture group 2 is Nothing in mul match at position $occ")
        p1 += parse(Int, m.captures[1]::SubString{String}) * parse(Int, m.captures[2]::SubString{String})
    end

    creg = r"do(?:n't)?\(\)"
    coccurences = findall(creg, input)
    enabled = ones(Bool, length(input))
    for (a, b) ∈ partition(coccurences, 2, 1)
        if length(a) != 4
            a2 = a[2]::Int
            b1 = b[1]::Int
            enabled[a2:b1] .= false
        end
    end
    if !isempty(coccurences) && length(coccurences[end]) != 4
        enabled[coccurences[end][2]:end] .= false
    end
    p2 = 0
    for occ ∈ occurences
        if enabled[occ[2]]
            m = match(reg, input[occ])
            !isnothing(m) || error("Regex match failed for mul pattern at position $occ")
            !isnothing(m.captures[1]) || error("Capture group 1 is Nothing in mul match at position $occ")
            !isnothing(m.captures[2]) || error("Capture group 2 is Nothing in mul match at position $occ")
            p2 += parse(Int, m.captures[1]::SubString{String}) * parse(Int, m.captures[2]::SubString{String})
        end
    end
    return [p1, p2]
end
function day23(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "day23.txt")))
    lines = split(strip(input), '\n')
    elves = Set{Tuple{Int,Int}}()
    
    for (i, line) in enumerate(lines)
        for (j, char) in enumerate(line)
            if char == '#'
                push!(elves, (i, j))
            end
        end
    end
    
    # Part 1: 10 rounds
    elves_copy = copy(elves)
    for r in 1:10
        elves_copy, _ = round!(elves_copy, r)
    end
    
    mini = minimum(x[1] for x in elves_copy)
    maxi = maximum(x[1] for x in elves_copy)
    minj = minimum(x[2] for x in elves_copy)
    maxj = maximum(x[2] for x in elves_copy)
    p1 = (maxi - mini + 1) * (maxj - minj + 1) - length(elves_copy)
    
    # Part 2: Find equilibrium
    p2 = 1
    while true
        elves, moved = round!(elves, p2)
        if !moved
            break
        end
        p2 += 1
    end
    
    return [p1, p2]
end

const DIRECTIONS = (
    (-1, -1), (-1, 0), (-1, 1),  # N row: NW, N, NE
    (1, -1), (1, 0), (1, 1),     # S row: SW, S, SE  
    (-1, -1), (0, -1), (1, -1),  # W col: NW, W, SW
    (-1, 1), (0, 1), (1, 1)      # E col: NE, E, SE
)

const MOVE_DIRECTIONS = ((-1, 0), (1, 0), (0, -1), (0, 1))  # N, S, W, E

function round!(elves::Set{Tuple{Int,Int}}, roundnumber::Int)
    # First phase: determine proposed moves
    proposals = Dict{Tuple{Int,Int}, Vector{Tuple{Int,Int}}}()
    
    for elf in elves
        if !considers_moving(elves, elf)
            continue
        end
        
        for i in 0:3
            dir_idx = mod1(roundnumber + i, 4)
            base_idx = (dir_idx - 1) * 3
            
            if (!((elf[1] + DIRECTIONS[base_idx + 1][1], elf[2] + DIRECTIONS[base_idx + 1][2]) in elves) &&
                !((elf[1] + DIRECTIONS[base_idx + 2][1], elf[2] + DIRECTIONS[base_idx + 2][2]) in elves) &&
                !((elf[1] + DIRECTIONS[base_idx + 3][1], elf[2] + DIRECTIONS[base_idx + 3][2]) in elves))
                
                new_pos = (elf[1] + MOVE_DIRECTIONS[dir_idx][1], elf[2] + MOVE_DIRECTIONS[dir_idx][2])
                
                if !haskey(proposals, new_pos)
                    proposals[new_pos] = Tuple{Int,Int}[]
                end
                push!(proposals[new_pos], elf)
                break
            end
        end
    end
    
    # Second phase: execute valid moves
    moved = false
    for (new_pos, proposing_elves) in proposals
        if length(proposing_elves) == 1
            old_pos = proposing_elves[1]
            delete!(elves, old_pos)
            push!(elves, new_pos)
            moved = true
        end
    end
    
    return elves, moved
end

@inline function considers_moving(elves::Set{Tuple{Int,Int}}, elf::Tuple{Int,Int})
    for di in -1:1, dj in -1:1
        if di == 0 && dj == 0
            continue
        end
        (elf[1] + di, elf[2] + dj) ∈ elves && return true
    end
    return false
end
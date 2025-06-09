function day17(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "day17.txt")))
    instructions = rstrip(input)
    shapes = (
        [(0, 0), (0, 1), (0, 2), (0, 3)],           # horizontal line
        [(0, 1), (1, 0), (1, 1), (1, 2), (2, 1)],   # plus
        [(0, 0), (0, 1), (0, 2), (1, 2), (2, 2)],   # L-shape
        [(0, 0), (1, 0), (2, 0), (3, 0)],           # vertical line
        [(0, 0), (0, 1), (1, 0), (1, 1)]            # square
    )
    
    diffs = part1(instructions, shapes, n = 2500)
    p1 = sum(diffs[1:2022])
    
    # Find cycle pattern
    cs = findall([all(diffs[101:101+200] .== diffs[i+100:i+100+200]) for i ∈ 1:2200])
    cycle = cs[2] - cs[1]
    heightincrease = sum(diffs[300:300+cycle])
    cycleadd = ((1_000_000_000_000 ÷ cycle) - 1) * heightincrease
    rest = mod(1_000_000_000_000, cycle) + cycle
    p2 = sum(diffs[1:rest]) + cycleadd
    
    return [p1, p2]
end

function part1(instructions::AbstractString, shapes::NTuple{5, Vector{Tuple{Int,Int}}}; n = 2022)
    occupied = Set{Tuple{Int,Int}}()
    
    # Add floor
    for j in 1:7
        push!(occupied, (0, j))
    end
    
    instri = 1
    shapei = 1
    diffs = zeros(Int, n)
    max_height = 0
    
    for k ∈ 1:n
        shape = shapes[shapei]
        
        # Start position: 3 units above highest rock, 2 units from left
        start_row = max_height + 4
        start_col = 3
        
        current_row, current_col = start_row, start_col
        
        while true
            # Apply jet push
            c = instructions[instri]
            instri = mod1(instri + 1, length(instructions))
            
            if c == '>'
                # Try to move right
                if can_move(occupied, shape, current_row, current_col + 1)
                    current_col += 1
                end
            else
                # Try to move left  
                if can_move(occupied, shape, current_row, current_col - 1)
                    current_col -= 1
                end
            end
            
            # Try to move down
            if can_move(occupied, shape, current_row - 1, current_col)
                current_row -= 1
            else
                # Can't move down - place the shape
                new_max = place_shape!(occupied, shape, current_row, current_col, max_height)
                diffs[k] = new_max - max_height
                max_height = new_max
                break
            end
        end
        
        shapei = mod1(shapei + 1, length(shapes))
    end
    
    return diffs
end

@inline function can_move(occupied::Set{Tuple{Int,Int}}, shape::Vector{Tuple{Int,Int}}, row::Int, col::Int)
    for (dr, dc) in shape
        new_row, new_col = row + dr, col + dc
        if new_col < 1 || new_col > 7 || (new_row, new_col) ∈ occupied
            return false
        end
    end
    return true
end

@inline function place_shape!(occupied::Set{Tuple{Int,Int}}, shape::Vector{Tuple{Int,Int}}, row::Int, col::Int, current_max::Int)
    new_max = current_max
    for (dr, dc) in shape
        pos = (row + dr, col + dc)
        push!(occupied, pos)
        new_max = max(new_max, row + dr)
    end
    return new_max
end
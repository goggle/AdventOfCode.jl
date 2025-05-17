using DataStructures

function day20(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "2024", "day20.txt")))
    data = stack(split(rstrip(input), '\n'))
    tte = time_to_end(data)
    return [count_cheats(tte, 100), count_cheats(tte, 100; max_time=20)]
end

function time_to_end(data::Matrix{Char})
    rows, cols = size(data)
    tte = fill(-1, rows, cols)
    goal = findfirst(==('E'), data)
    !isnothing(goal) || error("No 'E' found in matrix.")
    queue = Deque{CartesianIndex{2}}()
    push!(queue, goal)
    tte[goal] = 0
    
    while !isempty(queue)
        elem = popfirst!(queue)
        current_time = tte[elem]
        for dir in (CartesianIndex(-1, 0), CartesianIndex(1, 0), CartesianIndex(0, -1), CartesianIndex(0, 1))
            neigh = elem + dir
            if checkbounds(Bool, data, neigh) && data[neigh] != '#' && tte[neigh] == -1
                tte[neigh] = current_time + 1
                push!(queue, neigh)
            end
        end
    end
    return tte
end

function count_cheats(tte::Matrix{Int}, threshold::Int; max_time::Int=2)
    rows, cols = size(tte)
    count = 0
    offsets = generate_offsets(max_time)
    
    for c in findall(>=(0), tte)
        ci, cj = Tuple(c)
        tte_c = tte[c]
        
        for (di, dj) in offsets
            ni, nj = ci + di, cj + dj
            if 1 <= ni <= rows && 1 <= nj <= cols
                e = CartesianIndex(ni, nj)
                if tte[e] >= 0 && tte[e] < tte_c
                    time_saved = tte_c - tte[e] - (abs(di) + abs(dj))
                    time_saved >= threshold && (count += 1)
                end
            end
        end
    end
    return count
end

@inline function generate_offsets(max_dist::Int)
    offsets = Tuple{Int,Int}[]
    sizehint!(offsets, (max_dist + 1)^2 * 4)
    for d in 0:max_dist
        for i in 0:d
            j = d - i
            for s1 in (-1, 1)
                for s2 in (-1, 1)
                    push!(offsets, (s1*i, s2*j))
                end
            end
        end
    end
    unique!(offsets)
    return offsets
end
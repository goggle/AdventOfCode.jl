function day24(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "2024", "day24.txt")))
    inits, rules = split(input, "\n\n")
    
    state = Dict{String,Int}()
    sizehint!(state, 350)
    
    init_lines = split(rstrip(inits), '\n')
    for line in init_lines
        name, value = split(line, ": ")
        state[name] = parse(Int, value)
    end
    
    rule_lines = split(rstrip(rules), '\n')
    rule_map = Dict{Tuple{String,String,String}, String}()  # (left, op, right) => output
    output_to_rule = Dict{String, Tuple{String,String,String}}()  # output => (left, op, right)
    
    for gate in rule_lines
        m = match(r"^(.*) (AND|OR|XOR) (.*) -> (.*)$", gate)
        left, op, right, output = m.captures
        rule_map[(left, op, right)] = output
        rule_map[(right, op, left)] = output  # Add reverse mapping
        output_to_rule[output] = (left, op, right)
    end
    
    # Process rules in topological order
    outputs = collect(keys(output_to_rule))
    
    # Kahn's algorithm for topological sort
    in_degree = Dict{String,Int}()
    graph = Dict{String,Vector{String}}()
    
    for output in outputs
        in_degree[output] = 0
        graph[output] = String[]
    end
    
    for (output, (left, _, right)) in output_to_rule
        for input in (left, right)
            if haskey(output_to_rule, input)
                push!(graph[input], output)
                in_degree[output] += 1
            end
        end
    end
    
    queue = [output for output in outputs if in_degree[output] == 0]
    top_order = String[]
    
    while !isempty(queue)
        node = popfirst!(queue)
        push!(top_order, node)
        
        for neighbor in graph[node]
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0
                push!(queue, neighbor)
            end
        end
    end
    
    # Evaluate in topological order
    for output in top_order
        left, op, right = output_to_rule[output]
        if haskey(state, left) && haskey(state, right)
            if op == "AND"
                state[output] = state[left] & state[right]
            elseif op == "OR"
                state[output] = state[left] | state[right]
            elseif op == "XOR"
                state[output] = state[left] ⊻ state[right]
            end
        end
    end
    

    z_outputs = [name for name in keys(state) if startswith(name, "z")]
    z_indices = sort([parse(Int, z[2:end]) for z in z_outputs])
    sorted_z = ["z$(lpad(i, 2, '0'))" for i in z_indices]
    
    part1 = 0
    for (i, vname) ∈ zip(z_indices, sorted_z)
        part1 += state[vname] << i
    end
    
    swapped = String[]
    sizehint!(swapped, 8)
    
    function fast_find_gate(a::String, b::String, op::String)
        get(rule_map, (a, op, b), nothing)
    end
    
    c0 = nothing
    for i ∈ 0:44
        n = lpad(i, 2, '0')
        xn = "x$n"
        yn = "y$n"
        c1 = nothing
        
        m1 = fast_find_gate(xn, yn, "XOR")
        n1 = fast_find_gate(xn, yn, "AND")
        
        if c0 !== nothing
            r1 = fast_find_gate(c0, m1, "AND")
            if r1 === nothing
                m1, n1 = n1, m1
                m1 ∉ swapped && push!(swapped, m1, n1)
                r1 = fast_find_gate(c0, m1, "AND")
            end
            
            z1 = fast_find_gate(c0, m1, "XOR")
            
            if m1 !== nothing && startswith(m1, "z")
                m1, z1 = z1, m1
                m1 ∉ swapped && push!(swapped, m1, z1)
            end
            
            if n1 !== nothing && startswith(n1, "z")
                n1, z1 = z1, n1
                n1 ∉ swapped && push!(swapped, n1, z1)
            end
            
            if r1 !== nothing && startswith(r1, "z")
                r1, z1 = z1, r1
                r1 ∉ swapped && push!(swapped, r1, z1)
            end
            
            c1 = fast_find_gate(r1, n1, "OR")
        end
        
        if c1 !== nothing && startswith(c1, "z") && c1 != "z45"
            c1, z1 = z1, c1
            c1 ∉ swapped && push!(swapped, c1, z1)
        end
        
        c0 = c1 === nothing ? n1 : c1
    end
    
    return [part1, join(sort!(swapped), ",")]
end
using Primes
import ..Day16: addr!, addi!, mulr!, muli!, banr!, bani!, borr!, bori!, setr!, seti!, gtir!, gtri!, gtrr!, eqir!, eqri!, eqrr!


function day19(input::String = readInput(joinpath(@__DIR__, "..", "..", "data", "day19.txt")))
    reg, instructions = parse_input(input)
    p1 = run(reg, instructions)
    p2 = run(reg, instructions, reg0=1)
    return [p1, p2]
end

function run(reg::Int, instructions; reg0=0)
    registers = Dict(
        0 => reg0,
        1 => 0,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 0,
    )
    ip = 0
    while true
        (ip < 0 || ip >= length(instructions)) && break

        # Note: This part has been reverse-engeneered from my given input
        # (so it won't work for other inputs)
        # When the instruction pointer is 3, the program
        # calculates all the divisors of the number stored
        # in register two and stores their sum in register 0.
        # So we can calculate the sum of these divisors in a more
        # efficient way:
        if ip == 3
            return factors(registers[2]) |> sum
        end

        instr = instructions[ip+1]
        registers[reg] = ip
        instr[1](registers, instr[2], instr[3], instr[4])
        ip = registers[reg]
        ip += 1
    end
    return registers[0]
end

function factors(n::T)::Vector{T} where T <: Integer
    sort(vec(map(prod, Iterators.product((p.^(0:m) for (p, m) in eachfactor(n))...))))
end

function parse_input(input::AbstractString)
    lines = split(input, "\n", keepempty=false)
    m = match(r"#ip\s+(\d+)", lines[1])
    ip = parse(Int, m.captures[1])
    d = Dict(
        "addr" => addr!,
        "addi" => addi!,
        "mulr" => mulr!,
        "muli" => muli!,
        "banr" => banr!,
        "bani" => bani!,
        "borr" => borr!,
        "bori" => bori!,
        "setr" => setr!,
        "seti" => seti!,
        "gtir" => gtir!,
        "gtri" => gtri!,
        "gtrr" => gtrr!,
        "eqir" => eqir!,
        "eqri" => eqri!,
        "eqrr" => eqrr!
    )
    instructions = []
    for line ∈ lines[2:end]
        m = match(r"(\w+)\s+(\d+)\s+(\d+)\s+(\d+)", line)
        instruction = (d[m.captures[1]], parse(Int, m.captures[2]), parse(Int, m.captures[3]), parse(Int, m.captures[4]))
        push!(instructions, instruction)
    end
    return ip, instructions
end

"""
    readInput(path::String)

Read the input from a file path.
"""
function readInput(path::String)
    open(path, "r") do file
        read(file, String)
    end
end

"""
    readInput(year::Integer, day::Integer)

Read the input for the specified year and day.
"""
function readInput(year::Integer, day::Integer)
    @assert 2015 <= year <= 2024 "Year must be between 2015 and 2024"
    @assert 1 <= day <= 25 "Day must be between 1 and 25"
    
    # Find the package root directory
    root_dir = dirname(dirname(pathof(AdventOfCode)))
    
    # Construct the absolute path to the data file
    path = joinpath(root_dir, "data", string(year), @sprintf("day%02d.txt", day))
    
    return readInput(path)
end

"""
    generate_image(image)

Utility function to decode ASCII art images from problem solutions.
"""
function generate_image(image)
    block = '\u2588'
    empty = ' '
    output = ""
    for i ∈ 1:size(image, 2)
        row = join(image[:, i])
        row = replace(row, "#" => block)
        row = replace(row, "." => empty)
        output *= row * "\n"
    end
    return output
end
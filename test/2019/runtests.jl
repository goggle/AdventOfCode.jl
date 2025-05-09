include("../../src/2019/intcode.jl")

@testset "AOC2019" begin
    @testset "Day 1" begin
        @test AOC2019.day01() == [3442987, 5161601]
    end
    
    @testset "Day 2" begin
        @test AOC2019.day02() == [3101844, 8478]
    end
    
    @testset "Day 3" begin
        inp1 = "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"
        @test AOC2019.day03(inp1) == [159, 610]
        inp2 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
        @test AOC2019.day03(inp2) == [135, 410]
        @test AOC2019.day03() == [1983, 107754]
    end
    
    @testset "Day 4" begin
        @test AOC2019.day04() == [1675, 1142]
    end
    
    @testset "Day 5" begin
        inp = parse.(Int, split("3,9,8,9,10,9,4,9,99,-1,8", ","))
        @test IntCode.run_program!(copy(inp), [8])[end] == 1
        @test IntCode.run_program!(copy(inp), [9])[end] == 0
    
        inp = parse.(Int, split("3,9,7,9,10,9,4,9,99,-1,8", ","))
        @test IntCode.run_program!(copy(inp), [7])[end] == 1
        @test IntCode.run_program!(copy(inp), [8])[end] == 0
        @test IntCode.run_program!(copy(inp), [9])[end] == 0
    
        inp = parse.(Int, split("3,3,1108,-1,8,3,4,3,99", ","))
        @test IntCode.run_program!(copy(inp), [8])[end] == 1
        @test IntCode.run_program!(copy(inp), [9])[end] == 0
    
        inp = parse.(Int, split("3,3,1107,-1,8,3,4,3,99", ","))
        @test IntCode.run_program!(copy(inp), [7])[end] == 1
        @test IntCode.run_program!(copy(inp), [8])[end] == 0
        @test IntCode.run_program!(copy(inp), [9])[end] == 0
    
        inp = parse.(Int, split("3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9", ","))
        @test IntCode.run_program!(copy(inp), [0])[end] == 0
        @test IntCode.run_program!(copy(inp), [-1])[end] == 1
        @test IntCode.run_program!(copy(inp), [1])[end] == 1
    
        inp = parse.(Int, split("3,3,1105,-1,9,1101,0,0,12,4,12,99,1", ","))
        @test IntCode.run_program!(copy(inp), [0])[end] == 0
        @test IntCode.run_program!(copy(inp), [-1])[end] == 1
        @test IntCode.run_program!(copy(inp), [1])[end] == 1
    
        inp = parse.(Int, split("3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99", ","))
        @test IntCode.run_program!(copy(inp), [7])[end] == 999
        @test IntCode.run_program!(copy(inp), [8])[end] == 1000
        @test IntCode.run_program!(copy(inp), [9])[end] == 1001
    
        @test AOC2019.day05() == [7566643, 9265694]
    end
    
    @testset "Day 6" begin
        @test AOC2019.day06("COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L\nK)YOU\nI)SAN") == [54, 4]
        @test AOC2019.day06() == [194721, 316]
    end
    
    @testset "Day 7" begin
        inp = parse.(Int, split("3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0", ","))
        @test AOC2019.Day07.run_amplifiers(inp, [4, 3, 2, 1, 0], 0) == 43210
    
        inp = parse.(Int, split("3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0", ","))
        @test AOC2019.Day07.run_amplifiers(inp, [0, 1, 2, 3, 4], 0) == 54321
    
        inp = parse.(Int, split("3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0", ","))
        @test AOC2019.Day07.run_amplifiers(inp, [1, 0, 4, 3, 2], 0) == 65210
    
        inp = parse.(Int, split("3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5", ","))
        @test AOC2019.Day07.run_feedback_loop(inp, [9, 8, 7, 6, 5], 0) == 139629729
    
        inp = parse.(Int, split("3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54,-5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,4,53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10", ","))
        @test AOC2019.Day07.run_feedback_loop(inp, [9, 7, 8, 5, 6], 0) == 18216
    
        @test AOC2019.day07() == [844468, 4215746]
    end
    
    @testset "Day 8" begin
        expected = "███  █  █ █  █ ███  █   █\n" *
                   "█  █ █ █  █  █ █  █ █   █\n" *
                   "█  █ ██   ████ █  █  █ █ \n" *
                   "███  █ █  █  █ ███    █  \n" *
                   "█ █  █ █  █  █ █ █    █  \n" *
                   "█  █ █  █ █  █ █  █   █  \n"
        @test AOC2019.day08() == [2375, expected]
    end
    
    @testset "Day 9" begin
        for T in (Int, BigInt)
            inp = parse.(T, split("109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99", ","))
            @test IntCode.run_program!(inp, nothing, nothing, nothing) == [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
    
            inp = parse.(T, split("1102,34915192,34915192,7,4,7,99,0", ","))
            @test IntCode.run_program!(inp, nothing, nothing, nothing)[end] == 1219070632396864
    
            inp = parse.(T, split("104,1125899906842624,99", ","))
            @test IntCode.run_program!(inp, nothing, nothing, nothing)[end] == 1125899906842624
        end
        @test AOC2019.day09() == [3601950151, 64236]
    end
    
    @testset "Day 10" begin
        inp = ".#..#\n" *
              ".....\n" *
              "#####\n" *
              "....#\n" *
              "...##\n"
        map = AOC2019.Day10._generate_map(inp)
        ast, count = AOC2019.Day10._evaluate_best_asteroid(map)
        @test AOC2019.Day10._to_puzzle_coordinates(ast) == CartesianIndex(3, 4)
        @test count == 8
    
        inp = "......#.#.\n" *
              "#..#.#....\n" *
              "..#######.\n" *
              ".#.#.###..\n" *
              ".#..#.....\n" *
              "..#....#.#\n" *
              "#..#....#.\n" *
              ".##.#..###\n" *
              "##...#..#.\n" *
              ".#....####\n"
        map = AOC2019.Day10._generate_map(inp)
        ast, count = AOC2019.Day10._evaluate_best_asteroid(map)
        @test AOC2019.Day10._to_puzzle_coordinates(ast) == CartesianIndex(5, 8)
        @test count == 33
    
        inp = "#.#...#.#.\n" *
              ".###....#.\n" *
              ".#....#...\n" *
              "##.#.#.#.#\n" *
              "....#.#.#.\n" *
              ".##..###.#\n" *
              "..#...##..\n" *
              "..##....##\n" *
              "......#...\n" *
              ".####.###.\n"
        map = AOC2019.Day10._generate_map(inp)
        ast, count = AOC2019.Day10._evaluate_best_asteroid(map)
        @test AOC2019.Day10._to_puzzle_coordinates(ast) == CartesianIndex(1, 2)
        @test count == 35
    
        inp = ".#..#..###\n" *
              "####.###.#\n" *
              "....###.#.\n" *
              "..###.##.#\n" *
              "##.##.#.#.\n" *
              "....###..#\n" *
              "..#.#..#.#\n" *
              "#..#.#.###\n" *
              ".##...##.#\n" *
              ".....#.#..\n"
        map = AOC2019.Day10._generate_map(inp)
        ast, count = AOC2019.Day10._evaluate_best_asteroid(map)
        @test AOC2019.Day10._to_puzzle_coordinates(ast) == CartesianIndex(6, 3)
        @test count == 41
    
        inp = ".#..##.###...#######\n" *
              "##.############..##.\n" *
              ".#.######.########.#\n" *
              ".###.#######.####.#.\n" *
              "#####.##.#.##.###.##\n" *
              "..#####..#.#########\n" *
              "####################\n" *
              "#.####....###.#.#.##\n" *
              "##.#################\n" *
              "#####.##.###..####..\n" *
              "..######..##.#######\n" *
              "####.##.####...##..#\n" *
              ".#####..#.######.###\n" *
              "##...#.##########...\n" *
              "#.##########.#######\n" *
              ".####.#.###.###.#.##\n" *
              "....##.##.###..#####\n" *
              ".#.#.###########.###\n" *
              "#.#.#.#####.####.###\n" *
              "###.##.####.##.#..##\n"
        map = AOC2019.Day10._generate_map(inp)
        ast, count = AOC2019.Day10._evaluate_best_asteroid(map)
        @test AOC2019.Day10._to_puzzle_coordinates(ast) == CartesianIndex(11, 13)
        @test count == 210
        ns = [1, 2, 3, 10, 20, 50, 100, 199, 200, 201, 299]
        expected = [CartesianIndex(a) for a in [(11,12), (12,1), (12,2), (12,8), (16,0), (16,9), (10,16), (9,6), (8,2), (10,9), (11,1)]]
        for (n, e) in zip(ns, expected)
            res = AOC2019.Day10._vaporize(map, ast, n)
            @test AOC2019.Day10._to_puzzle_coordinates(res) == e
        end
    
        @test AOC2019.day10() == [329, 512]
    end
    
    @testset "Day 11" begin
        img = " █  █ ███   ██   ██  ████ █     ██  ███    \n" *
              " █  █ █  █ █  █ █  █ █    █    █  █ █  █   \n" *
              " █  █ █  █ █    █  █ ███  █    █    █  █   \n" *
              " █  █ ███  █    ████ █    █    █    ███    \n" *
              " █  █ █ █  █  █ █  █ █    █    █  █ █      \n" *
              "  ██  █  █  ██  █  █ █    ████  ██  █      \n"
        @test AOC2019.day11() == [2088, img]
    end
    
    @testset "Day 12" begin
        inp = "<x=-1, y=0, z=2>\n" *
              "<x=2, y=-10, z=-7>\n" *
              "<x=4, y=-8, z=8>\n" *
              "<x=3, y=5, z=-1>"
        @test AOC2019.day12(inp) == [183, 2772]
    
        inp = "<x=-8, y=-10, z=0>\n" *
              "<x=5, y=5, z=10>\n" *
              "<x=2, y=-7, z=3>\n" *
              "<x=9, y=-8, z=-3>"
        @test AOC2019.day12(inp) == [14645, 4686774924]
    
        @test AOC2019.day12() == [10635, 583523031727256]
    end
    
    @testset "Day 13" begin
        @test AOC2019.day13() == [363, 17159]
    end
    
    @testset "Day 14" begin
        inp = "10 ORE => 10 A\n" *
              "1 ORE => 1 B\n" *
              "7 A, 1 B => 1 C\n" *
              "7 A, 1 C => 1 D\n" *
              "7 A, 1 D => 1 E\n" *
              "7 A, 1 E => 1 FUEL"
        @test AOC2019.day14(inp) == [31, 34482758620]
    
        inp = "9 ORE => 2 A\n" *
              "8 ORE => 3 B\n" *
              "7 ORE => 5 C\n" *
              "3 A, 4 B => 1 AB\n" *
              "5 B, 7 C => 1 BC\n" *
              "4 C, 1 A => 1 CA\n" *
              "2 AB, 3 BC, 4 CA => 1 FUEL"
        @test AOC2019.day14(inp) == [165, 6323777403]
    
        inp = "157 ORE => 5 NZVS\n" *
              "165 ORE => 6 DCFZ\n" *
              "44 XJWVT, 5 KHKGT, 1 QDVJ, 29 NZVS, 9 GPVTF, 48 HKGWZ => 1 FUEL\n" *
              "12 HKGWZ, 1 GPVTF, 8 PSHF => 9 QDVJ\n" *
              "179 ORE => 7 PSHF\n" *
              "177 ORE => 5 HKGWZ\n" *
              "7 DCFZ, 7 PSHF => 2 XJWVT\n" *
              "165 ORE => 2 GPVTF\n" *
              "3 DCFZ, 7 NZVS, 5 HKGWZ, 10 PSHF => 8 KHKGT"
        @test AOC2019.day14(inp) == [13312, 82892753]
    
        inp = "2 VPVL, 7 FWMGM, 2 CXFTF, 11 MNCFX => 1 STKFG\n" *
              "17 NVRVD, 3 JNWZP => 8 VPVL\n" *
              "53 STKFG, 6 MNCFX, 46 VJHF, 81 HVMC, 68 CXFTF, 25 GNMV => 1 FUEL\n" *
              "22 VJHF, 37 MNCFX => 5 FWMGM\n" *
              "139 ORE => 4 NVRVD\n" *
              "144 ORE => 7 JNWZP\n" *
              "5 MNCFX, 7 RFSQX, 2 FWMGM, 2 VPVL, 19 CXFTF => 3 HVMC\n" *
              "5 VJHF, 7 MNCFX, 9 VPVL, 37 CXFTF => 6 GNMV\n" *
              "145 ORE => 6 MNCFX\n" *
              "1 NVRVD => 8 CXFTF\n" *
              "1 VJHF, 6 MNCFX => 4 RFSQX\n" *
              "176 ORE => 6 VJHF"
        @test AOC2019.day14(inp) == [180697, 5586022]
    
        inp = "171 ORE => 8 CNZTR\n" *
              "7 ZLQW, 3 BMBT, 9 XCVML, 26 XMNCP, 1 WPTQ, 2 MZWV, 1 RJRHP => 4 PLWSL\n" *
              "114 ORE => 4 BHXH\n" *
              "14 VRPVC => 6 BMBT\n" *
              "6 BHXH, 18 KTJDG, 12 WPTQ, 7 PLWSL, 31 FHTLT, 37 ZDVW => 1 FUEL\n" *
              "6 WPTQ, 2 BMBT, 8 ZLQW, 18 KTJDG, 1 XMNCP, 6 MZWV, 1 RJRHP => 6 FHTLT\n" *
              "15 XDBXC, 2 LTCX, 1 VRPVC => 6 ZLQW\n" *
              "13 WPTQ, 10 LTCX, 3 RJRHP, 14 XMNCP, 2 MZWV, 1 ZLQW => 1 ZDVW\n" *
              "5 BMBT => 4 WPTQ\n" *
              "189 ORE => 9 KTJDG\n" *
              "1 MZWV, 17 XDBXC, 3 XCVML => 2 XMNCP\n" *
              "12 VRPVC, 27 CNZTR => 2 XDBXC\n" *
              "15 KTJDG, 12 BHXH => 5 XCVML\n" *
              "3 BHXH, 2 VRPVC => 7 MZWV\n" *
              "121 ORE => 7 VRPVC\n" *
              "7 XCVML => 6 RJRHP\n" *
              "5 BHXH, 4 VRPVC => 5 LTCX"
        @test AOC2019.day14(inp) == [2210736, 460664]
    
        @test AOC2019.day14() == [371695, 4052920]
    end
    
    @testset "Day 15" begin
        @test AOC2019.day15() == [374, 482]
    end
    
    @testset "Day 16" begin
        for (inp, out) in zip(("80871224585914546619083218645595",
                               "19617804207202209144916044189917",
                               "69317163492948606335995924319873"), (
                               24176176, 73745418, 52432133))
            digits = parse.(Int8, split(strip(inp), ""))
            @test AOC2019.Day16.part1!(digits) == out
        end
        for (inp, out) in zip(("03036732577212944063491565474664",
                               "02935109699940807407585447034323",
                               "03081770884921959731165446850517"), (
                               84462026, 78725270, 53553731))
            digits = parse.(Int8, split(strip(inp), ""))
            @test AOC2019.Day16.part2(digits) == out
        end
        @test AOC2019.day16() == [25131128, 53201602]
    end
    
    @testset "Day 17" begin
        @test AOC2019.day17() == [3936, 785733]
    end
    
    @testset "Day 18" begin
        inp = "#########\n" *
              "#b.A.@.a#\n" *
              "#########\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part1(maze) == 8
    
        inp = "########################\n" *
              "#f.D.E.e.C.b.A.@.a.B.c.#\n" *
              "######################.#\n" *
              "#d.....................#\n" *
              "########################\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part1(maze) == 86
    
        inp = "########################\n" *
              "#...............b.C.D.f#\n" *
              "#.######################\n" *
              "#.....@.a.B.c.d.A.e.F.g#\n" *
              "########################\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part1(maze) == 132
    
        inp = "#################\n" *
              "#i.G..c...e..H.p#\n" *
              "########.########\n" *
              "#j.A..b...f..D.o#\n" *
              "########@########\n" *
              "#k.E..a...g..B.n#\n" *
              "########.########\n" *
              "#l.F..d...h..C.m#\n" *
              "#################\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part1(maze) == 136
    
        inp = "########################\n" *
              "#@..............ac.GI.b#\n" *
              "###d#e#f################\n" *
              "###A#B#C################\n" *
              "###g#h#i################\n" *
              "########################\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part1(maze) == 81
    
        inp = "#######\n" *
              "#a.#Cd#\n" *
              "##1#2##\n" *
              "#######\n" *
              "##4#3##\n" *
              "#cB#Ab#\n" *
              "#######\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part2(maze) == 8
    
        inp = "###############\n" *
              "#d.ABC.#.....a#\n" *
              "######1#2######\n" *
              "###############\n" *
              "######3#4######\n" *
              "#b.....#.....c#\n" *
              "###############\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part2(maze) == 24
    
        inp = "#############\n" *
              "#DcBa.#.GhKl#\n" *
              "#.###1#2#I###\n" *
              "#e#d#####j#k#\n" *
              "###C#3#4###J#\n" *
              "#fEbA.#.FgHi#\n" *
              "#############\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part2(maze) == 32
    
        inp = "#############\n" *
              "#g#f.D#..h#l#\n" *
              "#F###e#E###.#\n" *
              "#dCba1#2BcIJ#\n" *
              "#############\n" *
              "#nK.L3#4G...#\n" *
              "#M###N#H###.#\n" *
              "#o#m..#i#jk.#\n" *
              "#############\n"
        maze = AOC2019.Day18.parse_input(inp)
        @test AOC2019.Day18.part2(maze) == 72
    
        @test AOC2019.day18() == [3962, 1844]
    end
    
    @testset "Day 19" begin
        @test AOC2019.day19() == [166, 3790981]
    end
    
    @testset "Day 20" begin
        inp = "         A          \n" *
              "         A          \n" *
              "  #######.######### \n" *
              "  #######.........# \n" *
              "  #######.#######.# \n" *
              "  #######.#######.# \n" *
              "  #######.#######.# \n" *
              "  #####  B    ###.# \n" *
              "BC...##  C    ###.# \n" *
              "  ##.##       ###.# \n" *
              "  ##...DE  F  ###.# \n" *
              "  #####    G  ###.# \n" *
              "  #########.#####.# \n" *
              "DE..#######...###.# \n" *
              "  #.#########.###.# \n" *
              "FG..#########.....# \n" *
              "  ###########.##### \n" *
              "             Z      \n" *
              "             Z      \n"
        @test AOC2019.day20(inp) == [23, 26]
    
        inp = "                   A               \n" *
              "                   A               \n" *
              "  #################.#############  \n" *
              "  #.#...#...................#.#.#  \n" *
              "  #.#.#.###.###.###.#########.#.#  \n" *
              "  #.#.#.......#...#.....#.#.#...#  \n" *
              "  #.#########.###.#####.#.#.###.#  \n" *
              "  #.............#.#.....#.......#  \n" *
              "  ###.###########.###.#####.#.#.#  \n" *
              "  #.....#        A   C    #.#.#.#  \n" *
              "  #######        S   P    #####.#  \n" *
              "  #.#...#                 #......VT\n" *
              "  #.#.#.#                 #.#####  \n" *
              "  #...#.#               YN....#.#  \n" *
              "  #.###.#                 #####.#  \n" *
              "DI....#.#                 #.....#  \n" *
              "  #####.#                 #.###.#  \n" *
              "ZZ......#               QG....#..AS\n" *
              "  ###.###                 #######  \n" *
              "JO..#.#.#                 #.....#  \n" *
              "  #.#.#.#                 ###.#.#  \n" *
              "  #...#..DI             BU....#..LF\n" *
              "  #####.#                 #.#####  \n" *
              "YN......#               VT..#....QG\n" *
              "  #.###.#                 #.###.#  \n" *
              "  #.#...#                 #.....#  \n" *
              "  ###.###    J L     J    #.#.###  \n" *
              "  #.....#    O F     P    #.#...#  \n" *
              "  #.###.#####.#.#####.#####.###.#  \n" *
              "  #...#.#.#...#.....#.....#.#...#  \n" *
              "  #.#####.###.###.#.#.#########.#  \n" *
              "  #...#.#.....#...#.#.#.#.....#.#  \n" *
              "  #.###.#####.###.###.#.#.#######  \n" *
              "  #.#.........#...#.............#  \n" *
              "  #########.###.###.#############  \n" *
              "           B   J   C               \n" *
              "           U   P   P               \n"
        @test AOC2019.Day20.solve(inp, (true, false)) == [58]
    
        inp = "             Z L X W       C                 \n" *
              "             Z P Q B       K                 \n" *
              "  ###########.#.#.#.#######.###############  \n" *
              "  #...#.......#.#.......#.#.......#.#.#...#  \n" *
              "  ###.#.#.#.#.#.#.#.###.#.#.#######.#.#.###  \n" *
              "  #.#...#.#.#...#.#.#...#...#...#.#.......#  \n" *
              "  #.###.#######.###.###.#.###.###.#.#######  \n" *
              "  #...#.......#.#...#...#.............#...#  \n" *
              "  #.#########.#######.#.#######.#######.###  \n" *
              "  #...#.#    F       R I       Z    #.#.#.#  \n" *
              "  #.###.#    D       E C       H    #.#.#.#  \n" *
              "  #.#...#                           #...#.#  \n" *
              "  #.###.#                           #.###.#  \n" *
              "  #.#....OA                       WB..#.#..ZH\n" *
              "  #.###.#                           #.#.#.#  \n" *
              "CJ......#                           #.....#  \n" *
              "  #######                           #######  \n" *
              "  #.#....CK                         #......IC\n" *
              "  #.###.#                           #.###.#  \n" *
              "  #.....#                           #...#.#  \n" *
              "  ###.###                           #.#.#.#  \n" *
              "XF....#.#                         RF..#.#.#  \n" *
              "  #####.#                           #######  \n" *
              "  #......CJ                       NM..#...#  \n" *
              "  ###.#.#                           #.###.#  \n" *
              "RE....#.#                           #......RF\n" *
              "  ###.###        X   X       L      #.#.#.#  \n" *
              "  #.....#        F   Q       P      #.#.#.#  \n" *
              "  ###.###########.###.#######.#########.###  \n" *
              "  #.....#...#.....#.......#...#.....#.#...#  \n" *
              "  #####.#.###.#######.#######.###.###.#.#.#  \n" *
              "  #.......#.......#.#.#.#.#...#...#...#.#.#  \n" *
              "  #####.###.#####.#.#.#.#.###.###.#.###.###  \n" *
              "  #.......#.....#.#...#...............#...#  \n" *
              "  #############.#.#.###.###################  \n" *
              "               A O F   N                     \n" *
              "               A A D   M                     \n"
        @test AOC2019.day20(inp) == [77, 396]
    
        @test AOC2019.day20() == [422, 5040]
    end
    
    @testset "Day 21" begin
        @test AOC2019.day21() == [19353074, 1147582556]
    end
    
    @testset "Day 22" begin
        @test AOC2019.day22() == [5540, 6821410630991]
    end
    
    @testset "Day 23" begin
        @test AOC2019.day23() == [17286, 11249]
    end
    
    @testset "Day 24" begin
        input = "....#\n" *
                "#..#.\n" *
                "#..##\n" *
                "..#..\n" *
                "#....\n"
        layout = AOC2019.Day24.parse_input(input)
        @test AOC2019.Day24.part1(layout) == 2129920
        @test AOC2019.Day24.part2(layout; niter = 10) == 99
    
        @test AOC2019.day24() == [18350099, 2037]
    end
    
    @testset "Day 25" begin
        @test AOC2019.day25() == 262848
    end
    
end
@testset "AOC2017" begin
    @testset "Day 1" begin
        @test AOC2017.day01("1122") == [3, 0]
        @test AOC2017.day01("1111") == [4, 4]
        @test AOC2017.day01("1234") == [0, 0]
        @test AOC2017.day01("91212129") == [9, 6]
        @test AOC2017.day01("1212") == [0, 6]
        @test AOC2017.day01("1221") == [3, 0]
        @test AOC2017.day01("123425") == [0, 4]
        @test AOC2017.day01("123123") == [0, 12]
        @test AOC2017.day01("12131415") == [0, 4]

        @test AOC2017.day01() == [1182, 1152]
    end
    
    @testset "Day 2" begin
        sample1 = "5\t1\t9\t5\n" *
                  "7\t5\t3\n" *
                  "2\t4\t6\t8\n"
        @test AOC2017.day02(sample1) == [18, 7]

        sample2 = "5\t9\t2\t8\n" *
                 "9\t4\t7\t3\n" *
                 "3\t8\t6\t5\n"
        @test AOC2017.day02(sample2) == [18, 9]
        
        @test AOC2017.day02() == [32121, 197]
    end
    
    @testset "Day 3" begin
        @test AOC2017.Day03.part1(12) == 3
        @test AOC2017.Day03.part1(23) == 2
        @test AOC2017.Day03.part1(1024) == 31
    
        @test AOC2017.day03() == [430, 312453]
    end
    
    @testset "Day 4" begin
        @test AOC2017.day04() == [325, 119]
    end
    
    @testset "Day 5" begin
        @test AOC2017.day05() == [387096, 28040648]
    end
    
    @testset "Day 6" begin
        @test AOC2017.day06() == [4074, 2793]
    end
    
    @testset "Day 7" begin
        @test AOC2017.day07() == ["cqmvs", 2310]
    end
    
    @testset "Day 8" begin
        @test AOC2017.day08() == [7296, 8186]
    end
    
    @testset "Day 9" begin
        @test AOC2017.day09() == [11347, 5404]
    end
    
    @testset "Day 10" begin
        @test AOC2017.day10() == [20056, "d9a7de4a809c56bf3a9465cb84392c8e"]
    end
    
    @testset "Day 11" begin
        @test AOC2017.day11() == [834, 1569]
    end
    
    @testset "Day 12" begin
        @test AOC2017.day12() == [288, 211]
    end
    
    @testset "Day 13" begin
        @test AOC2017.day13() == [1728, 3946838]
    end
    
    @testset "Day 14" begin
        @test AOC2017.day14() == [8214, 1093]
    end
    
    @testset "Day 15" begin
        @test AOC2017.day15() == [650, 336]
    end
    
    @testset "Day 16" begin
        @test AOC2017.day16() == ["ceijbfoamgkdnlph", "pnhajoekigcbflmd"]
    end
    
    @testset "Day 17" begin
        @test AOC2017.day17("3\n") == [638, 1222153]
        @test AOC2017.day17() == [1914, 41797835]
    end
    
    @testset "Day 18" begin
        sample = "set a 1\n" *
                 "add a 2\n" *
                 "mul a a\n" *
                 "mod a 5\n" *
                 "snd a\n" *
                 "set a 0\n" *
                 "rcv a\n" *
                 "jgz a -1\n" *
                 "set a 1\n" *
                 "jgz a -2\n"
        sample2 = "snd 1\n" *
                  "snd 2\n" *
                  "snd p\n" *
                  "rcv a\n" *
                  "rcv b\n" *
                  "rcv c\n" *
                  "rcv d\n"
        @test AOC2017.day18(sample) == [4, 1]
        @test AOC2017.day18(sample2) == [0, 3]
        @test AOC2017.day18() == [1187, 5969]
    end
    
    @testset "Day 19" begin
        @test AOC2017.day19() == ["EOCZQMURF", 16312]
    end
    
    @testset "Day 20" begin
        @test AOC2017.day20() == [300, 502]
    end
    
    @testset "Day 21" begin
        sample = "../.# => ##./#../...\n" *
                 ".#./..#/### => #..#/..../..../#..#\n"
        @test AOC2017.day21() == [188, 2758764]
    end
    
    @testset "Day 22" begin
        @test AOC2017.day22() == [5433, 2512599]
    end
    
    @testset "Day 23" begin
        @test AOC2017.day23() == [4225, 905]
    end
    
    @testset "Day 24" begin
        sample = "0/2\n" *
                 "2/2\n" *
                 "2/3\n" *
                 "3/4\n" *
                 "3/5\n" *
                 "0/1\n" *
                 "10/1\n" *
                 "9/10\n"
        @test AOC2017.day24(sample) == [31, 19]
        @test AOC2017.day24() == [2006, 1994]
    end
    
    @testset "Day 25" begin
        sample = "Begin in state A.\n" *
                 "Perform a diagnostic checksum after 6 steps.\n" *
                 "\n" *
                 "In state A:\n" *
                 "  If the current value is 0:\n" *
                 "    - Write the value 1.\n" *
                 "    - Move one slot to the right.\n" *
                 "    - Continue with state B.\n" *
                 "  If the current value is 1:\n" *
                 "    - Write the value 0.\n" *
                 "    - Move one slot to the left.\n" *
                 "    - Continue with state B.\n" *
                 "\n" *
                 "In state B:\n" *
                 "  If the current value is 0:\n" *
                 "    - Write the value 1.\n" *
                 "    - Move one slot to the left.\n" *
                 "    - Continue with state A.\n" *
                 "  If the current value is 1:\n" *
                 "    - Write the value 1.\n" *
                 "    - Move one slot to the right.\n" *
                 "    - Continue with state A.\n"
        @test AOC2017.day25(sample) == 3
        @test AOC2017.day25() == 3578
    end
end
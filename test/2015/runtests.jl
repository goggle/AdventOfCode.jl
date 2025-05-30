@testset "AOC2015" begin
    @testset "Day 1" begin
        @test AOC2015.Day01.part1("(())") == 0
        @test AOC2015.Day01.part1("()()") == 0
        @test AOC2015.Day01.part1("(((") == 3
        @test AOC2015.Day01.part1("(()(()(") == 3
        @test AOC2015.Day01.part1("))(((((") == 3
        @test AOC2015.Day01.part1("())") == -1
        @test AOC2015.Day01.part1("))(") == -1
        @test AOC2015.Day01.part1(")))") == -3
        @test AOC2015.Day01.part1(")())())") == -3
        @test AOC2015.Day01.part2(")") == 1
        @test AOC2015.Day01.part2("()())") == 5
        @test AOC2015.day01() == [74, 1795]
    end
    
    @testset "Day 2" begin
        @test AOC2015.Day02.part1([[2,3,4]]) == 58
        @test AOC2015.Day02.part1([[1,1,10]]) == 43
        @test AOC2015.Day02.part2([[2,3,4]]) == 34
        @test AOC2015.Day02.part2([[1,1,10]]) == 14
        @test AOC2015.day02() == [1588178, 3783758]
    end
    
    @testset "Day 3" begin
        @test AOC2015.Day03.part1(">") == 2
        @test AOC2015.Day03.part1("^>v<") == 4
        @test AOC2015.Day03.part1("^v^v^v^v^v") == 2
        @test AOC2015.Day03.part2("^v") == 3
        @test AOC2015.Day03.part2("^>v<") == 3
        @test AOC2015.Day03.part2("^v^v^v^v^v") == 11
        @test AOC2015.day03() == [2081, 2341]
    end
    
    @testset "Day 4" begin
        @test AOC2015.Day04.solve("abcdef", 5) == 609043
        @test AOC2015.Day04.solve("pqrstuv", 5) == 1048970
        @test AOC2015.day04() == [117946, 3938038]
    end
    
    @testset "Day 5" begin
        @test AOC2015.Day05.isnice("ugknbfddgicrmopn") == true
        @test AOC2015.Day05.isnice("aaa") == true
        @test AOC2015.Day05.isnice("jchzalrnumimnmhp") == false
        @test AOC2015.Day05.isnice("haegwjzuvuyypxyu") == false
        @test AOC2015.Day05.isnice("dvszwmarrgswjxmb") == false
        @test AOC2015.Day05.isnice2("qjhvhtzxzqqjkmpb") == true
        @test AOC2015.Day05.isnice2("xxyxx") == true
        @test AOC2015.Day05.isnice2("uurcxstgmygtbstg") == false
        @test AOC2015.Day05.isnice2("ieodomkazucvgmuy") == false
        @test AOC2015.day05() == [238, 69]
    end
    
    @testset "Day 6" begin
        sample = "turn on 0,0 through 999,999\n" *
                 "toggle 0,0 through 999,0\n" *
                 "turn off 499,499 through 500,500\n"
        @test AOC2015.day06(sample) == [998996, 1001996]
        @test AOC2015.day06() == [569999, 17836115]
    end
    
    @testset "Day 7" begin
        sample = "123 -> x\n" *
                 "456 -> y\n" *
                 "x AND y -> d\n" *
                 "x OR y -> e\n" *
                 "x LSHIFT 2 -> f\n" *
                 "y RSHIFT 2 -> g\n" *
                 "NOT x -> h\n" *
                 "NOT y -> i\n"
        wires = AOC2015.Day07.setup(sample)
        AOC2015.Day07.run!(wires, sample)
        @test take!(wires["x"].value) == 123
        @test take!(wires["y"].value) == 456
        @test take!(wires["d"].value) == 72
        @test take!(wires["e"].value) == 507
        @test take!(wires["f"].value) == 492
        @test take!(wires["g"].value) == 114
        @test take!(wires["h"].value) == 65412
        @test take!(wires["i"].value) == 65079
    
        @test AOC2015.day07() == [956, 40149]
    end
    
    @testset "Day 8" begin
        sample = "\"\"\n" *
                 "\"abc\"\n" *
                 "\"aaa\\\"aaa\"\n" *
                 "\"\\x27\""
        @test AOC2015.day08(sample) == [12, 19]
        @test AOC2015.day08() == [1350, 2085]
    end
    
    @testset "Day 9" begin
        sample = "London to Dublin = 464\n" *
                 "London to Belfast = 518\n" *
                 "Dublin to Belfast = 141\n"
        @test AOC2015.day09(sample) == [605, 982]
        @test AOC2015.day09() == [141, 736]
    end
    
    @testset "Day 10" begin
        @test AOC2015.day10() == [252594, 3579328]
    end
    
    @testset "Day 11" begin
        @test AOC2015.day11() == ["hepxxyzz", "heqaabcc"]
    end
    
    @testset "Day 12" begin
        @test AOC2015.day12() == [156366, 96852]
    end
    
    @testset "Day 13" begin
        sample = "Alice would gain 54 happiness units by sitting next to Bob.\n" *
                 "Alice would lose 79 happiness units by sitting next to Carol.\n" *
                 "Alice would lose 2 happiness units by sitting next to David.\n" *
                 "Bob would gain 83 happiness units by sitting next to Alice.\n" *
                 "Bob would lose 7 happiness units by sitting next to Carol.\n" *
                 "Bob would lose 63 happiness units by sitting next to David.\n" *
                 "Carol would lose 62 happiness units by sitting next to Alice.\n" *
                 "Carol would gain 60 happiness units by sitting next to Bob.\n" *
                 "Carol would gain 55 happiness units by sitting next to David.\n" *
                 "David would gain 46 happiness units by sitting next to Alice.\n" *
                 "David would lose 7 happiness units by sitting next to Bob.\n" *
                 "David would gain 41 happiness units by sitting next to Carol.\n"
        @test AOC2015.day13(sample) == [330, 286]
        @test AOC2015.day13() == [733, 725]
    end
    
    @testset "Day 14" begin
        sample = "Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.\n" *
                 "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.\n"
        @test AOC2015.day14(sample) == [2660, 1564]
        @test AOC2015.day14() == [2640, 1102]
    end
    
    @testset "Day 15" begin
        sample = "Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8\n" *
                 "Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3\n"
        @test AOC2015.day15(sample) == [62842880, 57600000]
        @test AOC2015.day15() == [21367368, 1766400]
    end
    
    @testset "Day 16" begin
        @test AOC2015.day16() == [373, 260]
    end
    
    @testset "Day 17" begin
        sample = "20\n15\n10\n5\n5\n"
        data = parse.(Int, split(sample))
        p1, ml = AOC2015.Day17.part1(data, 25)
        p2 = AOC2015.Day17.part2(data, 25, ml)
        @test p1 == 4
        @test p2 == 3
    
        @test AOC2015.day17() == [654, 57]
    end
    
    @testset "Day 18" begin
        @test AOC2015.day18() == [768, 781]
    end
    
    @testset "Day 19" begin
        @test AOC2015.day19() == [576, 207]
    end
    
    @testset "Day 20" begin
        @test AOC2015.day20() == [776160, 786240]
    end
    
    @testset "Day 21" begin
        @test AOC2015.day21() == [91, 158]
    end
    
    @testset "Day 22" begin
        @test AOC2015.day22() == [953, 1289]
    end
    
    @testset "Day 23" begin
        @test AOC2015.day23() == [170, 247]
    end
    
    @testset "Day 24" begin
        @test AOC2015.day24() == [11266889531, 77387711]
    end
    
    @testset "Day 25" begin
        @test AOC2015.day25() == 9132360
    end
end
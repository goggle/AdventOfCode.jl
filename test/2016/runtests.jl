@testset "AOC2016" begin
    @testset "Day 1" begin
        @test AOC2016.day01() == [273, 115]
    end
    
    @testset "Day 2" begin
        sample = "ULL\n" *
                 "RRDDD\n" *
                 "LURDL\n" *
                 "UUUUD\n"
        @test AOC2016.day02(sample) == [1985, "5DB3"]
        @test AOC2016.day02() == [61529, "C2C28"]
    end
    
    @testset "Day 3" begin
        @test AOC2016.day03() == [1032, 1838]
    end
    
    @testset "Day 4" begin
        @test AOC2016.Day04.is_real("aaaaa-bbb-z-y-x-123[abxyz]") == true
        @test AOC2016.Day04.is_real("a-b-c-d-e-f-g-h-987[abcde]") == true
        @test AOC2016.Day04.is_real("not-a-real-room-404[oarel]") == true
        @test AOC2016.Day04.is_real("totally-real-room-200[decoy]") == false
        @test AOC2016.Day04.decrypt("qzmt-zixmtkozy-ivhz", 343) == "very encrypted name"
        @test AOC2016.day04() == [185371, 984]
    end
    
    @testset "Day 5" begin
        sample = "abc"
        @test AOC2016.Day05.part1(sample, len=2) == "18"
        @test AOC2016.Day05.part2(sample, len=2) == "05"
    end
    
    @testset "Day 6" begin
        sample = "eedadn\n" *
                 "drvtee\n" *
                 "eandsr\n" *
                 "raavrd\n" *
                 "atevrs\n" *
                 "tsrnev\n" *
                 "sdttsa\n" *
                 "rasrtv\n" *
                 "nssdts\n" *
                 "ntnada\n" *
                 "svetve\n" *
                 "tesnvt\n" *
                 "vntsnd\n" *
                 "vrdear\n" *
                 "dvrsen\n" *
                 "enarar\n"
        @test AOC2016.day06(sample) == ["easter", "advent"]
        @test AOC2016.day06() == ["umcvzsmw", "rwqoacfz"]
    end
    
    @testset "Day 7" begin
        @test AOC2016.Day07.supports_tls("abba[mnop]qrst") == true
        @test AOC2016.Day07.supports_tls("abcd[bddb]xyyx") == false
        @test AOC2016.Day07.supports_tls("aaaa[qwer]tyui") == false
        @test AOC2016.Day07.supports_tls("ioxxoj[asdfgh]zxcvbn") == true
    
        @test AOC2016.Day07.supports_ssl("aba[bab]xyz") == true
        @test AOC2016.Day07.supports_ssl("xyx[xyx]xyx") == false
        @test AOC2016.Day07.supports_ssl("aaa[kek]eke") == true
        @test AOC2016.Day07.supports_ssl("zazbz[bzb]cdb") == true
    
        @test AOC2016.day07() == [110, 242]
    end
    
    @testset "Day 8" begin
        screen = zeros(Bool, 3, 7)
        res1 = [1 1 1 0 0 0 0;
                1 1 1 0 0 0 0;
                0 0 0 0 0 0 0]
        AOC2016.Day08.rect!(screen, 3, 2)
        @test screen == res1
        res2 = [1 0 1 0 0 0 0;
                1 1 1 0 0 0 0;
                0 1 0 0 0 0 0]
        AOC2016.Day08.rotd!(screen, 1+1, 1)
        @test screen == res2
        res3 = [0 0 0 0 1 0 1;
                1 1 1 0 0 0 0;
                0 1 0 0 0 0 0]
        AOC2016.Day08.rotr!(screen, 0+1, 4)
        @test screen == res3
        res4 = [0 1 0 0 1 0 1;
                1 0 1 0 0 0 0;
                0 1 0 0 0 0 0]
        AOC2016.Day08.rotd!(screen, 1+1, 1)
        @test screen == res4
        image = " ██  ████ █    ████ █     ██  █   █████  ██   ███ \n" *
                "█  █ █    █    █    █    █  █ █   ██    █  █ █    \n" *
                "█    ███  █    ███  █    █  █  █ █ ███  █    █    \n" *
                "█    █    █    █    █    █  █   █  █    █     ██  \n" *
                "█  █ █    █    █    █    █  █   █  █    █  █    █ \n" *
                " ██  █    ████ ████ ████  ██    █  █     ██  ███  \n"
        @test AOC2016.day08() == [106, image]
    end
    
    @testset "Day 9" begin
        @test AOC2016.Day09.part1("ADVENT") == 6
        @test AOC2016.Day09.part1("A(1x5)BC") == 7
        @test AOC2016.Day09.part1("(3x3)XYZ") == 9
        @test AOC2016.Day09.part1("A(2x2)BCD(2x2)EFG") == 11
        @test AOC2016.Day09.part1("(6x1)(1x3)A") == 6
        @test AOC2016.Day09.part1("X(8x2)(3x3)ABCY") == 18
    
        @test AOC2016.Day09.part2("(3x3)XYZ") == 9
        @test AOC2016.Day09.part2("X(8x2)(3x3)ABCY") == 20
        @test AOC2016.Day09.part2("(27x12)(20x12)(13x14)(7x10)(1x12)A") == 241920
        @test AOC2016.Day09.part2("(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN") == 445
    
        @test AOC2016.day09() == [107035, 11451628995]
    end
    
    @testset "Day 10" begin
        @test AOC2016.day10() == [181, 12567]
    end
    
    @testset "Day 11" begin
        @test AOC2016.day11() == [31, 55]
    end
    
    @testset "Day 12" begin
        @test AOC2016.day12() == [318009, 9227663]
    end
    
    @testset "Day 13" begin
        @test AOC2016.Day13.solve(10, 7, 4) == [11, 151]
        @test AOC2016.day13() == [92, 124]
    end
    
    @testset "Day 14" begin
        @test AOC2016.Day14.solve("abc", 0) == 22728
        @test AOC2016.Day14.solve("abc", 100) == 25661
    end
    
    @testset "Day 15" begin
        sample = "Disc #1 has 5 positions; at time=0, it is at position 4.\n" *
                 "Disc #2 has 2 positions; at time=0, it is at position 1.\n"
        @test AOC2016.day15(sample) == [5, 85]
        @test AOC2016.day15() == [317371, 2080951]
    end
    
    @testset "Day 16" begin
        @test AOC2016.Day16.generate_data(BitVector([1]), 3) == BitVector([1, 0, 0])
        @test AOC2016.Day16.generate_data(BitVector([0]), 3) == BitVector([0, 0, 1])
        @test AOC2016.Day16.generate_data(BitVector([1, 1, 1, 1, 1]), 11) == BitVector([1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0])
        @test AOC2016.Day16.generate_data(BitVector([1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0]), 25) == BitVector([1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0])
        @test AOC2016.Day16.calculate_checksum(BitVector([1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0]), 12) == "100"
        a = BitVector([1, 0, 0, 0, 0])
        data = AOC2016.Day16.generate_data(a, 20)
        @test AOC2016.Day16.calculate_checksum(data, 20) == "01100"
    
        @test AOC2016.day16() == ["10010100110011100", "01100100101101100"]
    end
    
    @testset "Day 17" begin
        @test AOC2016.Day17.find_path("ihgpwlah") == "DDRRRD"
        @test AOC2016.Day17.find_path("kglvqrro") == "DDUDRLRRUDRD"
        @test AOC2016.Day17.find_path("ulqzkmiv") == "DRURDRUDDLLDLUURRDULRLDUUDDDRR"
        @test AOC2016.Day17.find_path("ihgpwlah"; shortest_path = false) == 370
        @test AOC2016.Day17.find_path("kglvqrro"; shortest_path = false) == 492
        @test AOC2016.Day17.find_path("ulqzkmiv"; shortest_path = false) == 830
    
        @test AOC2016.day17() == ["DURLDRRDRD", 650]
    end
    
    @testset "Day 18" begin
        @test AOC2016.day18() == [1926, 19986699]
    end
    
    @testset "Day 19" begin
        @test AOC2016.day19("5") == [3, 2]
        @test AOC2016.day19() == [1815603, 1410630]
    end
    
    @testset "Day 20" begin
        @test AOC2016.day20() == [4793564, 146]
    end
    
    @testset "Day 21" begin
        sample = "swap position 4 with position 0\n" *
                 "swap letter d with letter b\n" *
                 "reverse positions 0 through 4\n" *
                 "rotate left 1 step\n" *
                 "move position 1 to position 4\n" *
                 "move position 3 to position 0\n" *
                 "rotate based on position of letter b\n" *
                 "rotate based on position of letter d\n"
        sample_instructions = AOC2016.Day21.parse_input(sample)
        rev_sample_instructions = AOC2016.Day21.reverse_instructions(sample_instructions)
        @test AOC2016.Day21.run("abcde", sample_instructions) == "decab"
        @test AOC2016.Day21.run("decab", rev_sample_instructions) == "abcde"
        @test AOC2016.day21() == ["dbfgaehc", "aghfcdeb"]
    end
    
    @testset "Day 22" begin
        @test AOC2016.day22() == [941, 249]
    end
    
    @testset "Day 23" begin
        @test AOC2016.day23() == [10880, 479007440]
    end
    
    @testset "Day 24" begin
        sample = "###########\n" *
                 "#0.1.....2#\n" *
                 "#.#######.#\n" *
                 "#4.......3#\n" *
                 "###########\n"
        samplemaze = vcat([x' for x in collect.(split(rstrip(sample)))]...)
        sampledistances = AOC2016.Day24.calculate_distance_matrix(samplemaze)
        @test AOC2016.Day24.shortest_distance(sampledistances) == 14
        @test AOC2016.Day24.shortest_distance(sampledistances, return_to_zero = true) == 20
    
        @test AOC2016.day24() == [412, 664]
    end
    
    @testset "Day 25" begin
        @test AOC2016.day25() == 192
    end
end
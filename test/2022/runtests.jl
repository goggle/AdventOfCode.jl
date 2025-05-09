@testset "AOC2022" begin
    @testset "Day 1" begin
        @test AOC2022.day01() == [74711, 209481]
    end
    
    @testset "Day 2" begin
        @test AOC2022.day02() == [13565, 12424]
    end
    
    @testset "Day 3" begin
        sample = "vJrwpWtwJgWrhcsFMMfFFhFp\n" *
                 "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\n" *
                 "PmmdzqPrVvPwwTWBwg\n" *
                 "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\n" *
                 "ttgJtRGJQctTZtZT\n" *
                 "CrZsJsPPZsGzwwsLwLmpwMDw\n"
        @test AOC2022.day03(sample) == [157, 70]
        @test AOC2022.day03() == [7831, 2683]
    end
    
    @testset "Day 4" begin
        @test AOC2022.day04() == [515, 883]
    end
    
    @testset "Day 5" begin
        @test AOC2022.day05() == ["JDTMRWCQJ", "VHJDDCWRD"]
    end
    
    @testset "Day 6" begin
        @test AOC2022.day06() == [1833, 3425]
    end
    
    @testset "Day 7" begin
        sample =
            "\$ cd /\n" *
            "\$ ls\n" *
            "dir a\n" *
            "14848514 b.txt\n" *
            "8504156 c.dat\n" *
            "dir d\n" *
            "\$ cd a\n" *
            "\$ ls\n" *
            "dir e\n" *
            "29116 f\n" *
            "2557 g\n" *
            "62596 h.lst\n" *
            "\$ cd e\n" *
            "\$ ls\n" *
            "584 i\n" *
            "\$ cd ..\n" *
            "\$ cd ..\n" *
            "\$ cd d\n" *
            "\$ ls\n" *
            "4060174 j\n" *
            "8033020 d.log\n" *
            "5626152 d.ext\n" *
            "7214296 k\n"
        @test AOC2022.day07(sample) == [95437, 24933642]
        @test AOC2022.day07() == [1543140, 1117448]
    end
    
    @testset "Day 8" begin
        sample = "30373\n" *
                 "25512\n" *
                 "65332\n" *
                 "33549\n" *
                 "35390\n"
        @test AOC2022.day08(sample) == [21, 8]
        @test AOC2022.day08() == [1818, 368368]
    end
    
    @testset "Day 9" begin
        sample = "R 4\n" *
                 "U 4\n" *
                 "L 3\n" *
                 "D 1\n" *
                 "R 4\n" *
                 "D 1\n" *
                 "L 5\n" *
                 "R 2\n"
        sample2 = "R 5\n" *
                  "U 8\n" *
                  "L 8\n" *
                  "D 3\n" *
                  "R 17\n" *
                  "D 10\n" *
                  "L 25\n" *
                  "U 20\n"
        @test AOC2022.day09(sample) == [13, 1]
        @test AOC2022.day09(sample2) == [88, 36]
        @test AOC2022.day09() == [5907, 2303]
    end
    
    @testset "Day 10" begin
        sample =
            "addx 15\n" *
            "addx -11\n" *
            "addx 6\n" *
            "addx -3\n" *
            "addx 5\n" *
            "addx -1\n" *
            "addx -8\n" *
            "addx 13\n" *
            "addx 4\n" *
            "noop\n" *
            "addx -1\n" *
            "addx 5\n" *
            "addx -1\n" *
            "addx 5\n" *
            "addx -1\n" *
            "addx 5\n" *
            "addx -1\n" *
            "addx 5\n" *
            "addx -1\n" *
            "addx -35\n" *
            "addx 1\n" *
            "addx 24\n" *
            "addx -19\n" *
            "addx 1\n" *
            "addx 16\n" *
            "addx -11\n" *
            "noop\n" *
            "noop\n" *
            "addx 21\n" *
            "addx -15\n" *
            "noop\n" *
            "noop\n" *
            "addx -3\n" *
            "addx 9\n" *
            "addx 1\n" *
            "addx -3\n" *
            "addx 8\n" *
            "addx 1\n" *
            "addx 5\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx -36\n" *
            "noop\n" *
            "addx 1\n" *
            "addx 7\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx 2\n" *
            "addx 6\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx 1\n" *
            "noop\n" *
            "noop\n" *
            "addx 7\n" *
            "addx 1\n" *
            "noop\n" *
            "addx -13\n" *
            "addx 13\n" *
            "addx 7\n" *
            "noop\n" *
            "addx 1\n" *
            "addx -33\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx 2\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx 8\n" *
            "noop\n" *
            "addx -1\n" *
            "addx 2\n" *
            "addx 1\n" *
            "noop\n" *
            "addx 17\n" *
            "addx -9\n" *
            "addx 1\n" *
            "addx 1\n" *
            "addx -3\n" *
            "addx 11\n" *
            "noop\n" *
            "noop\n" *
            "addx 1\n" *
            "noop\n" *
            "addx 1\n" *
            "noop\n" *
            "noop\n" *
            "addx -13\n" *
            "addx -19\n" *
            "addx 1\n" *
            "addx 3\n" *
            "addx 26\n" *
            "addx -30\n" *
            "addx 12\n" *
            "addx -1\n" *
            "addx 3\n" *
            "addx 1\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx -9\n" *
            "addx 18\n" *
            "addx 1\n" *
            "addx 2\n" *
            "noop\n" *
            "noop\n" *
            "addx 9\n" *
            "noop\n" *
            "noop\n" *
            "noop\n" *
            "addx -1\n" *
            "addx 2\n" *
            "addx -37\n" *
            "addx 1\n" *
            "addx 3\n" *
            "noop\n" *
            "addx 15\n" *
            "addx -21\n" *
            "addx 22\n" *
            "addx -6\n" *
            "addx 1\n" *
            "noop\n" *
            "addx 2\n" *
            "addx 1\n" *
            "noop\n" *
            "addx -10\n" *
            "noop\n" *
            "noop\n" *
            "addx 20\n" *
            "addx 1\n" *
            "addx 2\n" *
            "addx 2\n" *
            "addx -6\n" *
            "addx -11\n" *
            "noop\n" *
            "noop\n" *
            "noop\n"
        @test AOC2022.day10(sample)[1] == 13140
        p1, p2 = AOC2022.day10()
        @test p1 == 13740
        @test p2 ==
              "████ █  █ ███  ███  ████ ████  ██  █    \n" *
              "   █ █  █ █  █ █  █ █    █    █  █ █    \n" *
              "  █  █  █ █  █ █  █ ███  ███  █    █    \n" *
              " █   █  █ ███  ███  █    █    █    █    \n" *
              "█    █  █ █    █ █  █    █    █  █ █    \n" *
              "████  ██  █    █  █ █    ████  ██  ████ \n"
    end
    
    @testset "Day 11" begin
        sample =
            "Monkey 0:\n" *
            "  Starting items: 79, 98\n" *
            "  Operation: new = old * 19\n" *
            "  Test: divisible by 23\n" *
            "    If true: throw to monkey 2\n" *
            "    If false: throw to monkey 3\n" *
            "\n" *
            "Monkey 1:\n" *
            "  Starting items: 54, 65, 75, 74\n" *
            "  Operation: new = old + 6\n" *
            "  Test: divisible by 19\n" *
            "    If true: throw to monkey 2\n" *
            "    If false: throw to monkey 0\n" *
            "\n" *
            "Monkey 2:\n" *
            "  Starting items: 79, 60, 97\n" *
            "  Operation: new = old * old\n" *
            "  Test: divisible by 13\n" *
            "    If true: throw to monkey 1\n" *
            "    If false: throw to monkey 3\n" *
            "\n" *
            "Monkey 3:\n" *
            "  Starting items: 74\n" *
            "  Operation: new = old + 3\n" *
            "  Test: divisible by 17\n" *
            "    If true: throw to monkey 0\n" *
            "    If false: throw to monkey 1\n"
        @test AOC2022.day11(sample) == [10605, 2713310158]
        @test AOC2022.day11() == [110888, 25590400731]
    end
    
    @testset "Day 12" begin
        sample = "Sabqponm\n" *
                 "abcryxxl\n" *
                 "accszExk\n" *
                 "acctuvwj\n" *
                 "abdefghi\n"
        @test AOC2022.day12(sample) == [31, 29]
        @test AOC2022.day12() == [420, 414]
    end
    
    @testset "Day 13" begin
        sample =
            "[1,1,3,1,1]\n" *
            "[1,1,5,1,1]\n" *
            "\n" *
            "[[1],[2,3,4]]\n" *
            "[[1],4]\n" *
            "\n" *
            "[9]\n" *
            "[[8,7,6]]\n" *
            "\n" *
            "[[4,4],4,4]\n" *
            "[[4,4],4,4,4]\n" *
            "\n" *
            "[7,7,7,7]\n" *
            "[7,7,7]\n" *
            "\n" *
            "[]\n" *
            "[3]\n" *
            "\n" *
            "[[[]]]\n" *
            "[[]]\n" *
            "\n" *
            "[1,[2,[3,[4,[5,6,7]]]],8,9]\n" *
            "[1,[2,[3,[4,[5,6,0]]]],8,9]\n"
        @test AOC2022.day13(sample) == [13, 140]
        @test AOC2022.day13() == [5659, 22110]
    end
    
    @testset "Day 14" begin
        sample = "498,4 -> 498,6 -> 496,6\n" *
                 "503,4 -> 502,4 -> 502,9 -> 494,9\n"
        @test AOC2022.day14(sample) == [24, 93]
        @test AOC2022.day14() == [793, 24166]
    end
    
    @testset "Day 15" begin
        @test AOC2022.day15() == [5166077, 13071206703981]
    end
    
    @testset "Day 16" begin
        sample =
            "Valve AA has flow rate=0; tunnels lead to valves DD, II, BB\n" *
            "Valve BB has flow rate=13; tunnels lead to valves CC, AA\n" *
            "Valve CC has flow rate=2; tunnels lead to valves DD, BB\n" *
            "Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE\n" *
            "Valve EE has flow rate=3; tunnels lead to valves FF, DD\n" *
            "Valve FF has flow rate=0; tunnels lead to valves EE, GG\n" *
            "Valve GG has flow rate=0; tunnels lead to valves FF, HH\n" *
            "Valve HH has flow rate=22; tunnel leads to valve GG\n" *
            "Valve II has flow rate=0; tunnels lead to valves AA, JJ\n" *
            "Valve JJ has flow rate=21; tunnel leads to valve II\n"
        @test AOC2022.day16(sample) == [1651, 1707]
        @test AOC2022.day16() == [1792, 2587]
    end
    
    @testset "Day 17" begin
        sample = ">>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>"
        @test AOC2022.day17(sample) == [3068, 1514285714288]
        @test AOC2022.day17() == [3071, 1523615160362]
    end
    
    @testset "Day 18" begin
        sample = "2,2,2\n" *
                 "1,2,2\n" *
                 "3,2,2\n" *
                 "2,1,2\n" *
                 "2,3,2\n" *
                 "2,2,1\n" *
                 "2,2,3\n" *
                 "2,2,4\n" *
                 "2,2,6\n" *
                 "1,2,5\n" *
                 "3,2,5\n" *
                 "2,1,5\n" *
                 "2,3,5\n"
        @test AOC2022.day18(sample) == [64, 58]
        @test AOC2022.day18() == [4302, 2492]
    end
    
    @testset "Day 19" begin
        sample =
            "Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 2 ore. Each obsidian robot costs 3 ore and 14 clay. Each geode robot costs 2 ore and 7 obsidian.\n" *
            "Blueprint 2: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 12 obsidian."
        @test AOC2022.day19(sample) == [33, 3472]
        @test AOC2022.day19() == [1616, 8990]
    end
    
    @testset "Day 20" begin
        sample = "1\n" *
                 "2\n" *
                 "-3\n" *
                 "3\n" *
                 "-2\n" *
                 "0\n" *
                 "4\n"
        @test AOC2022.day20(sample) == [3, 1623178306]
        @test AOC2022.day20() == [13883, 19185967576920]
    end
    
    @testset "Day 21" begin
        sample =
            "root: pppw + sjmn\n" *
            "dbpl: 5\n" *
            "cczh: sllz + lgvd\n" *
            "zczc: 2\n" *
            "ptdq: humn - dvpt\n" *
            "dvpt: 3\n" *
            "lfqf: 4\n" *
            "humn: 5\n" *
            "ljgn: 2\n" *
            "sjmn: drzm * dbpl\n" *
            "sllz: 4\n" *
            "pppw: cczh / lfqf\n" *
            "lgvd: ljgn * ptdq\n" *
            "drzm: hmdt - zczc\n" *
            "hmdt: 32\n"
        @test AOC2022.day21(sample) == [152, 301]
        @test AOC2022.day21() == [10037517593724, 3272260914328]
    end
    
    @testset "Day 22" begin
        @test AOC2022.day22() == [155060, 3479]
    end
    
    @testset "Day 23" begin
        sample = "....#..\n" *
                 "..###.#\n" *
                 "#...#.#\n" *
                 ".#...##\n" *
                 "#.###..\n" *
                 "##.#.##\n" *
                 ".#..#..\n"
        @test AOC2022.day23(sample) == [110, 20]
        @test AOC2022.day23() == [4195, 1069]
    end
    
    @testset "Day 24" begin
        sample = "#.######\n" *
                 "#>>.<^<#\n" *
                 "#.<..<<#\n" *
                 "#>v.><>#\n" *
                 "#<^v^^>#\n" *
                 "######.#\n"
        @test AOC2022.day24(sample) == [18, 54]
        @test AOC2022.day24() == [240, 717]
    end
    
    @testset "Day 25" begin
        sample = "1=-0-2\n" *
                 "12111\n" *
                 "2=0=\n" *
                 "21\n" *
                 "2=01\n" *
                 "111\n" *
                 "20012\n" *
                 "112\n" *
                 "1=-1=\n" *
                 "1-12\n" *
                 "12\n" *
                 "1=\n" *
                 "122\n"
        @test AOC2022.day25(sample) == "2=-1=0"
        @test AOC2022.day25() == "2--1=0=-210-1=00=-=1"
    end
end
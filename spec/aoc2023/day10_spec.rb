# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day10" do
  it "calculates 4 for 10 test data pt 1" do
    Aoc2023::Day10.read_input("input/day10-test.txt")
    solution = Aoc2023::Day10.solve1

    expect(solution).to eq(4)
  end

  it "calculates 8 for 10 test data pt 1 - tst 2" do
    Aoc2023::Day10.read_input("input/day10-test2.txt")

    solution = Aoc2023::Day10.solve1

    expect(solution).to eq(8)
  end

  it "calculates 6725 for 10 data pt 1" do
    Aoc2023::Day10.read_input("input/day10.txt")

    solution = Aoc2023::Day10.solve1

    expect(solution).to eq(6_725)
  end

  it "calculates 1 for 10 test data pt 2" do
    Aoc2023::Day10.read_input("input/day10-test.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(1)
  end

  it "calculates 4 for 10 test data pt 2 - tst3" do
    Aoc2023::Day10.read_input("input/day10-test3.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(4)
  end

  it "calculates 4 for 10 test data pt 2 - tst4" do
    Aoc2023::Day10.read_input("input/day10-test4.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(4)
  end

  it "calculates 8 for 10 test data pt 2 - tst5" do
    Aoc2023::Day10.read_input("input/day10-test5.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(8)
  end
  
  it "calculates 10 for 10 test data pt 2 - tst6" do
    Aoc2023::Day10.read_input("input/day10-test6.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(10)
  end

  it "calculates 383 for 10 data pt 2" do
    Aoc2023::Day10.read_input("input/day10.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(383)
  end
end

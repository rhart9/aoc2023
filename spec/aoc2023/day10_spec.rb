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

  it "calculates ? for 10 test data pt 2" do
    Aoc2023::Day10.read_input("input/day10-test.txt")

    solution = Aoc2023::Day10.solve2
  
    expect(solution).to eq(0)
  end
end

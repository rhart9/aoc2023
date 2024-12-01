# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day12" do
  it "calculates 21 for 12 test data pt 1" do
    Aoc2023::Day12.read_input("input/day12-test.txt")

    solution = Aoc2023::Day12.solve1

    expect(solution).to eq(21)
  end

  it "calculates 2 for 12 test data pt 1 tst 2" do
    Aoc2023::Day12.read_input("input/day12-test2.txt")

    solution = Aoc2023::Day12.solve1

    expect(solution).to eq(2)
  end

  it "calculates 7674 for 12 data pt 1" do
    Aoc2023::Day12.read_input("input/day12.txt")

    solution = Aoc2023::Day12.solve1

    expect(solution).to eq(7_674)
  end

  it "calculates ? for 12 test data pt 2" do
    Aoc2023::Day12.read_input("input/day12-test.txt")
  
    solution = Aoc2023::Day12.solve2
  
    expect(solution).to eq(0)
  end
end

# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day11" do
  it "calculates 374 for 11 test data pt 1" do
    Aoc2023::Day11.read_input("input/day11-test.txt")

    solution = Aoc2023::Day11.solve1

    expect(solution).to eq(374)
  end

  it "calculates 9521550 for 11 data pt 1" do
    Aoc2023::Day11.read_input("input/day11.txt")

    solution = Aoc2023::Day11.solve1

    expect(solution).to eq(9_521_550)
  end

  it "calculates 1030 for 11 test data pt 2, factor 10" do
    Aoc2023::Day11.read_input("input/day11-test.txt")
  
    solution = Aoc2023::Day11.solve_common(10)
  
    expect(solution).to eq(1_030)
  end

  it "calculates 8410 for 11 test data pt 2, factor 100" do
    Aoc2023::Day11.read_input("input/day11-test.txt")
  
    solution = Aoc2023::Day11.solve_common(100)
  
    expect(solution).to eq(8_410)
  end
end

# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day11" do
  it "calculates 374 for 11 test data pt 1" do
    Aoc2023::Day11.read_input("input/day11-test.txt")

    solution = Aoc2023::Day11.solve1

    expect(solution).to eq(374)
  end

  # it "calculates ? for 11 data pt 1" do
  #   Aoc2023::Day11.read_input("input/day11.txt")

  #   solution = Aoc2023::Day11.solve1

  #   expect(solution).to eq(0)
  # end

  it "calculates ? for 11 test data pt 2" do
    Aoc2023::Day11.read_input("input/day11-test.txt")
  
    solution = Aoc2023::Day11.solve2
  
    expect(solution).to eq(0)
  end
end

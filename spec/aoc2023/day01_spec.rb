# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day01" do
  it "calculates 142 for 01 test1 data" do
    lines = File.readlines("input/day01-test1.txt")

    solution = Aoc2023::Day01.solve1(lines)

    expect(solution).to eq(142)
  end

  it "calculates 281 for 01 test2 data" do
    lines = File.readlines("input/day01-test2.txt")

    solution = Aoc2023::Day01.solve2(lines)

    expect(solution).to eq(281)
  end
end
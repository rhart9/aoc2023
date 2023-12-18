# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day02" do
  it "calculates 8 for 02 test1 data" do
    lines = File.readlines("input/day02-test.txt")

    solution = Aoc2023::Day02.solve1(lines)

    expect(solution).to eq(8)
  end

  it "calculates 2286 for 02 test data" do
    lines = File.readlines("input/day02-test.txt")

    solution = Aoc2023::Day02.solve2(lines)

    expect(solution).to eq(2286)
  end
end

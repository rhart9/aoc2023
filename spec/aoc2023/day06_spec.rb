# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day06" do
  it "calculates 288 for 06 test data pt 1" do
    lines = File.readlines("input/day06-test.txt", chomp: true)

    solution = Aoc2023::Day06.solve1(lines)

    expect(solution).to eq(288)
  end

  it "calculates 131376 for 06 data pt 1" do
    lines = File.readlines("input/day06.txt", chomp: true)

    solution = Aoc2023::Day06.solve1(lines)

    expect(solution).to eq(131_376)
  end

  it "calculates 71503 for 06 test data pt 2" do
    lines = File.readlines("input/day06-test.txt", chomp: true)
  
    solution = Aoc2023::Day06.solve2(lines)
  
    expect(solution).to eq(71_503)
  end
end

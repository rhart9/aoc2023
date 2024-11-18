# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day09" do
  it "calculates 114 for 09 test data pt 1" do
    lines = File.readlines("input/day09-test.txt", chomp: true)

    solution = Aoc2023::Day09.solve1(lines)

    expect(solution).to eq(114)
  end

  it "calculates 1581679977 for 09 data pt 1" do
    lines = File.readlines("input/day09.txt", chomp: true)

    solution = Aoc2023::Day09.solve1(lines)

    expect(solution).to eq(1_581_679_977)
  end

  it "calculates ? for 09 test data pt 2" do
    lines = File.readlines("input/day09-test.txt", chomp: true)
  
    solution = Aoc2023::Day09.solve2(lines)
  
    expect(solution).to eq(0)
  end
end

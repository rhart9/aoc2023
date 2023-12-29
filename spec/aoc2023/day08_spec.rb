# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day08" do
  it "calculates 2 for 08 test data pt 1.1" do
    lines = File.readlines("input/day08-test.txt", chomp: true)

    solution = Aoc2023::Day08.solve1(lines)

    expect(solution).to eq(2)
  end

  it "calculates 6 for 08 test data pt 1.2" do
    lines = File.readlines("input/day08-test2.txt", chomp: true)

    solution = Aoc2023::Day08.solve1(lines)

    expect(solution).to eq(6)
  end

  it "calculates 23147 for 08 data" do
    lines = File.readlines("input/day08.txt", chomp: true)

    solution = Aoc2023::Day08.solve1(lines)

    expect(solution).to eq(23_147)
  end

  it "calculates ? for 08 test data pt 2" do
    lines = File.readlines("input/day08-test.txt", chomp: true)
  
    solution = Aoc2023::Day08.solve2(lines)
  
    expect(solution).to eq(0)
  end
end

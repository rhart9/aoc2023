# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day03" do
  it "calculates 4361 for 03 test data" do
    lines = File.readlines("input/day03-test.txt", chomp: true)

    solution = Aoc2023::Day03.solve1(lines)

    expect(solution).to eq(4361)
  end

  it "calculates 556367 for 03 data" do
    lines = File.readlines("input/day03.txt", chomp: true)

    solution = Aoc2023::Day03.solve1(lines)

    expect(solution).to eq(556_367)
  end

  it "calculates 467835 for 03 test data pt 2" do
    lines = File.readlines("input/day03-test.txt", chomp: true)

    solution = Aoc2023::Day03.solve2(lines)

    expect(solution).to eq(467_835)
  end
end

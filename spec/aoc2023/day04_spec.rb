# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day04" do
  it "calculates 13 for 04 test data pt 1" do
    lines = File.readlines("input/day04-test.txt", chomp: true)

    solution = Aoc2023::Day04.solve1(lines)

    expect(solution).to eq(13)
  end

  it "calculates 30 for 04 test data pt 2" do
    lines = File.readlines("input/day04-test.txt", chomp: true)
  
    solution = Aoc2023::Day04.solve2(lines)
  
    expect(solution).to eq(30)
  end
end

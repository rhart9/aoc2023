# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day07" do
  it "calculates 6440 for 07 test data pt 1" do
    lines = File.readlines("input/day07-test.txt", chomp: true)

    solution = Aoc2023::Day07.solve1(lines)

    expect(solution).to eq(6_440)
  end

  it "calculates 250370104" do
    lines = File.readlines("input/day07.txt", chomp: true)

    solution = Aoc2023::Day07.solve1(lines)

    expect(solution).to eq(250_370_104)
  end

  it "calculates 5905 for 07 test data pt 2" do
    lines = File.readlines("input/day07-test.txt", chomp: true)
  
    solution = Aoc2023::Day07.solve2(lines)
  
    expect(solution).to eq(5_905)
  end
end

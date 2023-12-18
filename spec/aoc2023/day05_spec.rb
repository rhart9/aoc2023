# frozen_string_literal: true

RSpec.describe Aoc2023, class_name: "Aoc2023::Day05" do
  it "calculates 35 for 05 test data pt 1" do
    lines = File.readlines("input/day05-test.txt", chomp: true)

    solution = Aoc2023::Day05.solve1(lines)

    expect(solution).to eq(35)
  end

  it "calculates 3374647 for 05 data pt 1" do
    lines = File.readlines("input/day05.txt", chomp: true)

    solution = Aoc2023::Day05.solve1(lines)

    expect(solution).to eq(3_374_647)
  end

  it "calculates 46 for 05 test data pt 2" do
    lines = File.readlines("input/day05-test.txt", chomp: true)

    solution = Aoc2023::Day05.solve2(lines)

    expect(solution).to eq(46)
  end

  it "calculates 6082852 for 05 data pt 2" do
    lines = File.readlines("input/day05.txt", chomp: true)

    solution = Aoc2023::Day05.solve2(lines)

    expect(solution).to eq(6_082_852)
  end
end

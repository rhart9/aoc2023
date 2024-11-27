# frozen_string_literal: true

module Aoc2023
  class Day11
    def self.read_input(filename)
      @@lines = File.readlines(filename, chomp: true)
    end

    def self.solve
      read_input("input/day11.txt")

      # pt 1
      puts solve1()

      # pt 2
      puts solve2()
    end

    def self.solve1
      val = 0

      empty_rows = (0...@@lines.length).to_a
      empty_cols = (0...@@lines[0].length).to_a

      galaxy_locations = []

      @@lines.each_with_index do |row, i|
        row.chars.each_with_index do |char, j|
          if char == "#"
            galaxy_locations << [i, j]
            empty_rows.delete(i)
            empty_cols.delete(j)
          end
        end
      end

      galaxy_locations.each_with_index do |loc1, i|
        galaxy_locations[i+1...galaxy_locations.length].each do |loc2|
          row1, row2 = loc1.first < loc2.first ? [loc1.first, loc2.first] : [loc2.first, loc1.first]
          col1, col2 = loc1.last < loc2.last ? [loc1.last, loc2.last] : [loc2.last, loc1.last]

          val += row2 - row1 + col2 - col1
          val += empty_rows.select { |row| row.between?(row1, row2) }.length 
          val += empty_cols.select { |col| col.between?(col1, col2) }.length
        end
      end

      return val
    end

    def self.solve2
      val = 0

      return val
    end
  end
end

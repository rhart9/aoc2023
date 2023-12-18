# frozen_string_literal: true

module Aoc2023
  class Day01
    def self.solve
      lines = File.readlines("input/day01.txt")

      # pt 1
      puts solve1(lines)

      # pt 2
      puts solve2(lines)
    end

    def self.solve1(lines)
      val = 0

      lines.each do |line|
        digits = line.scan(/(\d)/).to_a

        unless digits.empty?
          val += (digits[0][0].to_i * 10) + digits[digits.length - 1][0].to_i
        end
      end

      return val
    end

    def self.solve2(lines)
      val = 0

      lines.each do |line|
        first_idx = -1
        first_val = 0
        last_idx = -1
        last_val = 0

        num_names = %w[one two three four five six seven eight nine]

        num_names.each_with_index do |element, i|
          [element, (i + 1).to_s].each do |search_pat|
            num_positions = line.gsub(search_pat).map { Regexp.last_match.begin(0) }
            unless num_positions.empty? # rubocop:disable Style/Next
              if first_idx == -1 || num_positions[0] < first_idx
                first_idx = num_positions[0]
                first_val = i + 1
              end
              if last_idx == -1 || num_positions[num_positions.length - 1] > last_idx
                last_idx = num_positions[num_positions.length - 1]
                last_val = i + 1
              end
            end
          end
        end

        val += (first_val * 10) + last_val
      end

      return val
    end
  end
end

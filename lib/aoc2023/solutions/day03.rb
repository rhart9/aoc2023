# frozen_string_literal: true

module Aoc2023
  class Day03
    def self.solve
      lines = File.readlines("input/day03.txt", chomp: true)

      solutions = solve_work(lines)

      # pt 1
      puts solutions[:solution1]

      # pt 2
      puts solutions[:solution2]
    end

    def self.solve1(lines)
      return solve_work(lines)[:solution1]
    end

    def self.solve2(lines)
      return solve_work(lines)[:solution2]
    end

    def self.solve_work(lines)
      val = 0
      gears = Hash.new([])

      lines.each_with_index do |line, i|
        matches = line.gsub(/(\d+)/).map { { digit: Regexp.last_match(0), pos: Regexp.last_match.begin(0) } }
        matches.each do |match|
          begin_col = match[:pos] - 1
          if begin_col == -1
            begin_col = 0
          else
            adjacent_chars_left = line[begin_col]
            if adjacent_chars_left == "*"
              gears[{ row: i, col: begin_col }] += [match[:digit]]
            end
          end

          end_col = match[:pos] + match[:digit].length
          if end_col >= line.length
            end_col -= 1
          else
            adjacent_chars_right = line[end_col]
            if adjacent_chars_right == "*"
              gears[{ row: i, col: end_col }] += [match[:digit]]
            end
          end

          if i > 0 # rubocop:disable Style/NumericPredicate
            adjacent_chars_top = lines[i - 1][begin_col..end_col]
            gear_cols = adjacent_chars_top.gsub("*").map { Regexp.last_match.begin(0) }
            gear_cols.each do |gear_col|
              gears[{ row: i - 1, col: begin_col + gear_col }] += [match[:digit]]
            end
          end

          if i < lines.length - 1
            adjacent_chars_bottom = lines[i + 1][begin_col..end_col]
            gear_cols = adjacent_chars_bottom.gsub("*").map { Regexp.last_match.begin(0) }
            gear_cols.each do |gear_col|
              gears[{ row: i + 1, col: begin_col + gear_col }] += [match[:digit]]
            end
          end

          adjacent_chars = "#{adjacent_chars_left}#{adjacent_chars_top}#{adjacent_chars_right}#{adjacent_chars_bottom}"

          unless (adjacent_chars =~ /[\W&&[^\.]]/).nil?
            val += match[:digit].to_i
          end
        end
      end

      val2 = 0

      gears.each_value do |gear|
        if gear.length == 2
          val2 += gear[0].to_i * gear[1].to_i
        end
      end

      return {
        solution1: val,
        solution2: val2
      }
    end


  end
end

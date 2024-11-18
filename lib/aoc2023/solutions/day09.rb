# frozen_string_literal: true

module Aoc2023
  class Day09
    def self.solve
      lines = File.readlines("input/day09.txt", chomp: true)

      # pt 1
      puts solve1(lines)

      # pt 2
      puts solve2(lines)
    end

    def self.solve1(lines)
      val = 0

      # Do what they said to do... could bite us in pt 2...

      @sensors = lines.map { |s| s.split(" ").map(&:to_i) }

      @sensors.each do |sensor_vals|
        num_vals = sensor_vals.length
        all_zeros = false

        until all_zeros
          all_zeros = true
          sensor_vals.each_with_index do |value, i|
            break if (i == num_vals - 1)
            sensor_vals[i] = sensor_vals[i + 1] - sensor_vals[i]
            all_zeros = false if sensor_vals[i] != 0
          end
          num_vals -= 1
        end

        val += sensor_vals[num_vals..].reduce(:+)
      end

      return val
    end

    def self.solve2(lines)
      val = 0

      return val
    end
  end
end

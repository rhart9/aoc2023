# frozen_string_literal: true

module Aoc2023
  class Day10
    @@directions = {
      "N" => {opposite: "S"}, 
      "S" => {opposite: "N"}, 
      "W" => {opposite: "E"}, 
      "E" => {opposite: "W"}
    }

    @@legend = {
      "|" => "NS",
      "-" => "EW",
      "L" => "NE",
      "J" => "NW",
      "7" => "SW",
      "F" => "SE"
    }

    def self.read_input(filename)
      @@lines = File.readlines(filename, chomp: true)
    end

    def self.solve
      read_input("input/day10.txt")

      # pt 1
      puts solve1()

      # pt 2
      puts solve2()
    end

    def self.solve1
      val = 0
      orig_row = 0
      orig_col = 0

      @@lines.each_with_index do |line, i|
        line.chars.each_with_index do |char, j|
          if char == "S"
            @row = orig_row = i
            @col = orig_col = j
          end
        end
      end

      @@directions.keys.each do |dir|
        @direction = dir
        @row = orig_row
        @col = orig_col
        move()
        unless @row == orig_row && @col == orig_col
          next_dir = get_next_dir()
          unless next_dir.nil?
            @direction = next_dir
            break
          end
        end
      end

      until @row == orig_row && @col == orig_col
        move()
        @direction = get_next_dir()
        val += 1
      end

      return ((val.to_f + 1) / 2).ceil
    end

    def self.move
      case @direction
      when "N"
        @row -= 1 if @row >= 0
      when "S"
        @row += 1 if @row < @@lines.length
      when "E"
        @col += 1 if @col < @@lines[@row].length
      when "W"
        @col -= 1 if @col >= 0
      end
    end

    def self.get_next_dir
      direction = nil

      if @@legend.key?(@@lines[@row][@col])
        pipedirs = @@legend[@@lines[@row][@col]].chars

        case @@directions[@direction][:opposite]
        when pipedirs.first
          direction = pipedirs.last
        when pipedirs.last
          direction = pipedirs.first
        end
      end

      return direction
    end

    def self.solve2
      val = 0

      return val
    end
  end
end

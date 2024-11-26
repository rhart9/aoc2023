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
      return self.solve_common(false)
    end

    def self.solve_common(save_boundaries)
      val = 0
      orig_row = 0
      orig_col = 0
      first_s_dir = ""

      @@boundaries = Hash.new { |h, k| h[k] = {} }

      @@lines.each_with_index do |line, i|
        line.chars.each_with_index do |char, j|
          if char == "S"
            @row = orig_row = i
            @col = orig_col = j
          end
        end
      end

      next_dir = nil

      @@directions.keys.each do |dir|
        @direction = dir
        @row = orig_row
        @col = orig_col
        move()
        unless @row == orig_row && @col == orig_col
          next_dir = get_next_dir()
          unless next_dir.nil?
            @direction = first_s_dir = dir
            break
          end
        end
      end

      until @row == orig_row && @col == orig_col
        if save_boundaries
          add_boundary(@@lines[@row][@col])
        end
        @direction = next_dir
        move()
        next_dir = get_next_dir()
        val += 1
      end

      if save_boundaries
        legend_char = @@legend.select { |k, v| v == "#{first_s_dir}#{@@directions[@direction][:opposite]}" || v == "#{@@directions[@direction][:opposite]}#{first_s_dir}" }.keys[0]
        add_boundary(legend_char)
      end

      return ((val.to_f + 1) / 2).ceil
    end

    def self.add_boundary(char)
      @@boundaries[@row].merge!({ @col => char }) unless char == "-"
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

    @@state_changes = {
      "|" => {
        :out => :in,
        :in => :out
      },
      "L" => {
        :out => :edgeLout,
        :in => :edgeLin
      },
      "F" => {
        :out => :edgeFout,
        :in => :edgeFin
      },
      "7" => {
        :edgeLin => :out,
        :edgeLout => :in,
        :edgeFin => :in,
        :edgeFout => :out
      },
      "J" => {
        :edgeLin => :in,
        :edgeLout => :out,
        :edgeFin => :out,
        :edgeFout => :in
      }
    }

    def self.solve2
      val = 0

      self.solve_common(true)

      @@boundaries.keys.each do |row|
        state = :out
        in_col = 0
        
        @@boundaries[row].keys.sort.each do |col|
          if state == :in
            val += (col - in_col - 1)
          end

          state = @@state_changes[@@boundaries[row][col]][state]

          if state == :in
            in_col = col
          end
        end
      end

      return val
    end
  end
end

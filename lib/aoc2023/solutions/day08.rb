# frozen_string_literal: true

module Aoc2023
  class Day08
    def self.solve
      lines = File.readlines("input/day08.txt", chomp: true)

      # pt 1
      puts solve1(lines)

      # pt 2
      puts solve2(lines)
    end

    def self.solve1(lines)
      @instructions = lines[0].split("")
      @nodes = {}

      lines[2..lines.length].each do |line|
        _, src, l, r = line.match(/(.{3}) = \((.{3}), (.{3})\)/).to_a

        @nodes[src] = [l, r]
      end

      current_node_addr = "AAA"
      instructions_pos = 0
      distance = 0

      # this seems dangerous but is the most obvious solution:

      until current_node_addr == "ZZZ"
        current_node = @nodes[current_node_addr]
        instruction = @instructions[instructions_pos]

        current_node_addr = instruction == "L" ? current_node.first : current_node.last

        distance += 1
        instructions_pos = instructions_pos == @instructions.length - 1 ? 0 : instructions_pos + 1
      end

      return distance
    end

    def self.solve2(lines)
      val = 0

      return val
    end
  end
end

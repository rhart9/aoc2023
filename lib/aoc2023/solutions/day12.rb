# frozen_string_literal: true

module Aoc2023
  class Day12
    def self.read_input(filename)
      @@lines = File.readlines(filename, chomp: true)
    end

    def self.solve
      read_input("input/day12.txt")

      # pt 1
      puts solve1()

      # pt 2
      puts solve2()
    end

    def self.solve1
      val = 0

      @instructions = @@lines.map do |s|
        spring_conds, group_sizes = s.split(" ")
        {spring_conds: spring_conds, group_sizes: group_sizes.split(",").map(&:to_i)}
      end

      @instructions.each do |instruction|
        @group_sizes = instruction[:group_sizes]
        val += num_configurations(0, instruction[:spring_conds])
      end

      return val
    end

    # find number of valid configurations with group number <group_no> within <spring_conds_part>
    def self.num_configurations(group_no, spring_conds_part)
      group_size = @group_sizes[group_no]
      needed_for_remaining_groups = (@group_sizes.length - group_no - 1)
      needed_for_remaining_groups += @group_sizes[group_no+1..].reduce(&:+) if needed_for_remaining_groups.positive?

      val = 0

      (0...spring_conds_part.length-needed_for_remaining_groups).each do |i|
        break if i > 0 && spring_conds_part[i-1] == "#"                   # group at level group_no can't start if there is a previous #

        next if spring_conds_part[i] == '.'                               # group can't start here
        next if i+group_size > spring_conds_part.length                   # not enough room for group
        next if spring_conds_part[i...i+group_size].chars.include?('.')   # group would contain .

        # Group group_no can exist in spring_conds_part[i...i+group_size]

        if group_no == @group_sizes.length - 1 # last group
          next if spring_conds_part[i+group_size..].chars.include?('#')   # group is larger than group_size or another group comes after

          val += 1
        else
          next if spring_conds_part[i+group_size] == "#"                  # group is larger than group_size
          next if i+group_size+1 >= spring_conds_part.length              # no room for another group

          val += num_configurations(group_no + 1, spring_conds_part[i+group_size+1..])
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

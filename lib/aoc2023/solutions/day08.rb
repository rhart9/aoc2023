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

      proc1 = lambda { |_nodes|
        ["AAA"]
      }

      proc2 = lambda { |current_node_addrs|
        current_node_addrs[0] == "ZZZ"
      }

      solve_work(lines, proc1, proc2)


    end

    def self.solve2(lines)
      proc1 = lambda { |nodes|
        nodes.filter { |node| node[2] == "A" }.keys
      }

      proc2 = lambda { |current_node_addrs|
        current_node_addrs.all? { |node|
          node[2] == "Z"
        }
      }

      solve_work2(lines, proc1, proc2)
    end

    def self.solve_work(lines, initialize_nodes_proc, check_nodes_proc)
      @instructions = lines[0].split("")
      @nodes = {}

      lines[2..lines.length].each do |line|
        _, src, l, r = line.match(/(.{3}) = \((.{3}), (.{3})\)/).to_a

        @nodes[src] = [l, r]
      end

      current_node_addrs = initialize_nodes_proc.call(@nodes)
      instructions_pos = 0
      distance = 0

      # this seems dangerous but is the most obvious solution:

      until check_nodes_proc.call(current_node_addrs)
        instruction = @instructions[instructions_pos]

        current_node_addrs.each_with_index do |current_node_addr, i|
          current_node = @nodes[current_node_addr]

          current_node_addrs[i] = instruction == "L" ? current_node.first : current_node.last
        end

        instructions_pos = instructions_pos == @instructions.length - 1 ? 0 : instructions_pos + 1
        distance += 1
      end

      # modification between pt 1 and pt 2 uses generic lambdas instead of hard coded node names for start and end conditions
      # this would work for both pt 1 and pt 2
      # however for pt 2 this amounts to a brute force solution that won't complete in any reasonable time frame

      return distance
    end

    def self.solve_work2(lines, initialize_nodes_proc, check_nodes_proc)
      @instructions = lines[0].split("")
      @nodes = {}
      @path_lengths = {}

      lines[2..lines.length].each do |line|
        _, src, l, r = line.match(/(.{3}) = \((.{3}), (.{3})\)/).to_a

        @nodes[src] = [l, r]
      end

      current_node_addrs = initialize_nodes_proc.call(@nodes)

      current_node_addrs.each_with_index do |current_node_addr, i|
        current_node_addr = current_node_addrs[i]
        instructions_pos = 0
        distance = 0

        until check_nodes_proc.call([current_node_addr])
          instruction = @instructions[instructions_pos]

          current_node = @nodes[current_node_addr]
          current_node_addr = instruction == "L" ? current_node.first : current_node.last

          instructions_pos = instructions_pos == @instructions.length - 1 ? 0 : instructions_pos + 1
          distance += 1
        end

        @path_lengths[current_node_addrs[i]] = distance
      end

      return @path_lengths.map(&:last).reduce { |a, b| lcm(a, b) }

      # very disappointing because this relies heavily on VERY specific properties of the data
      # namely that the length from any **A node to a **Z node is always a multiple of the length of the instruction set
      # and furthermore that the **Z node then cycles back to itself (and does not cross any other **Z nodes) in exactly the same number of steps

      # the problem does not indicate that the input data will have this property, but apparently they all do!

      # challenge for later: implement a solution that would work for an input data set without these properties 
      # and that runs in reasonable time for the test input set

      # below is a part of an attempt to calculate path lengths for such a solution.  it didn't work in reasonable time but could be a starting point

      # @nodes.each do |node|
      #   current_node = node.last
      #   all_next_nodes = []

      #   @instructions.each do |instruction|
      #     next_node_addr = instruction == "L" ? current_node.first : current_node.last
      #     all_next_nodes << next_node_addr
      #     current_node = @nodes[next_node_addr]
      #   end

      #   @node_full_paths[node.first] = all_next_nodes
      # end

      # proc2 = lambda { |paths|
      #   x = paths.map { |path| path[@instructions.length - 1] }
      #   if x.all? { |node| node[2] == "Z" }
      #     return i
      #   end
      #   return 0
      # }

      # paths = @node_full_paths.filter { |path| path[2] == "A" }.map(&:last)

      # val = 0

      # until (found_pos = proc2.call(paths)).positive?
      #   val += @instructions.length
      #   new_paths = []
      #   paths.each do |path|
      #     new_paths << @node_full_paths[path.last]
      #   end
      #   paths = new_paths
      # end

      # val += found_pos + 1
      # return val
    end

    def self.lcm(a, b)
      a / gcd(a, b) * b
    end

    def self.gcd(a, b)
      if (a == 0 || a == b)
        return b
      elsif (b == 0)
        return a
      elsif (a > b)
        return gcd(a%b, b)
      else
        return gcd(b%a, a)
      end
    end
  end
end

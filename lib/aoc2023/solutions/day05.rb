# frozen_string_literal: true

require "rbtree"

module Aoc2023
  class Day05
    def self.solve
      lines = File.readlines("input/day05.txt", chomp: true)

      solutions = solve_work(lines)

      # pt 1
      puts solutions[:solution1]

      # pt 2
      puts solutions[:solution2]
    end

    # the number of maps per section in the AOC data is not very large so the choice of data structure does not actually matter much
    # but the condition for matching the right map is that the input number is contained within a range
    # so there would be no benefit from using a hashtable, it would need to be iterated through entirely
    # furthermore, it simplifies things if "gaps" in the maps are included in this structure
    # finding these gaps with an array/hash would require sorting, then re-sorting to make the lookup faster
    # an rbtree with an appropriate Range-comparator will solve these problems
    # the comparator needs to handle both key sorting and searching for a single number covered by the Range
    # the single number has to be converted to a size-1 Range
    @range_comparator = proc { |r1, r2|
      if (r1.exclude_end? && r1.end <= r2.begin) || r1.end < r2.begin
        -1
      elsif (r2.exclude_end? && r2.end <= r1.begin) || r2.end < r1.begin
        1
      else
        0
      end
    }

    def self.solve_work(lines)
      _, seeds_sect = lines[0].match(/seeds: (.+)/).to_a
      seeds = seeds_sect.split(" ")

      curr_src = ""
      curr_dst = ""
      @type_map = {}
      type_map_pat = /(\w+)-to-(\w+) map:/

      lines[2..lines.length].each do |line|
        _, src, dst = line.match(type_map_pat).to_a if line =~ type_map_pat
        unless src.nil?
          curr_src = src
          curr_dst = dst

          tree = RBTree[]
          tree.readjust(&@range_comparator)

          @type_map[{ src: curr_src, dst: curr_dst }] = tree
          next
        end

        unless line.empty? # rubocop:disable Style/Next
          dst_range_start, src_range_start, range_len = line.split(" ")
          range = (src_range_start.to_i...src_range_start.to_i + range_len.to_i)
          @type_map[{ src: curr_src, dst: curr_dst }][range] = { range: range, dst_range_start: dst_range_start.to_i }
        end
      end

      # find unmapped ranges (gaps in the given maps) and add to each tree
      @type_map.transform_values! do |map|
        unmapped_ranges = []

        if map.first.first.begin > 0 # rubocop:disable Style/NumericPredicate
          unmapped_ranges << (0...map.first.first.begin)
        end

        map.each_cons(2) do |e1, e2|
          if e1.first.end < e2.first.begin
            unmapped_ranges << (e1.first.end + 1...e2.first.begin)
          end
        end
        unmapped_ranges.each do |range|
          map[range] = { range: range, dst_range_start: range.begin }
        end

        map
      end

      final_vals = []

      seeds.each do |seed|
        final_vals.append(get_location(seed)[:location])
      end

      solution1 = final_vals.min

      final_vals = []

      seed_ranges = seeds.each_slice(2).map { |range_start, range_len| (range_start.to_i...range_start.to_i + range_len.to_i) }

      seed_ranges.each do |seed_range|
        seed = seed_range.begin

        until seed >= seed_range.end
          location = get_location(seed)
          final_vals.append(location[:location])
          if location[:skip_seed_values].zero?
            seed = seed_range.end
          else
            seed += location[:skip_seed_values]
          end
        end
      end

      solution2 = final_vals.min

      return {
        solution1: solution1,
        solution2: solution2
      }
    end

    def self.solve1(lines)
      return solve_work(lines)[:solution1]
    end

    def self.solve2(lines)
      return solve_work(lines)[:solution2]
    end

    # calculate the number of remaining items in each mapped range
    # since we are only looking for the minimum, anything greater in the same range will map to a greater number
    # keep doing this all the way down, if this number is smaller in a further section then use that distance instead
    # return this to the caller.  this many seed numbers can be skipped since we know they will calculate to a higher number.
    def self.get_location(seed)
      current_value = seed.to_i
      skip_seed_values = 0

      @type_map.each do |_, maps| # rubocop:disable Style/HashEachMethods
        map_element = maps[(current_value..current_value)]
        next if map_element.nil?

        range = map_element[:range]
        dst_range_start = map_element[:dst_range_start]

        dist_to_end = range.end - current_value
        current_value = dst_range_start - range.begin + current_value
        if skip_seed_values.zero? || dist_to_end < skip_seed_values
          skip_seed_values = dist_to_end
        end
      end

      return {
        location: current_value,
        skip_seed_values: skip_seed_values
      }
    end

    # iterate through locations starting at 0, reverse the process to find the seed and check if it is in one of the seed ranges.
    # this does work but has a potential infinite loop problem
    # problem does not have any constraints to limit the loop so it would be arbitrary
    # also this takes way too long compared to above algorithm
    def self.iterate_locations(seed_ranges)
      location = 0
      loop do
        current_value = location
        @type_map.reverse_each.to_h.each do |_, maps| # rubocop:disable Style/HashEachMethods
          maps.each do |range, dst_range_start|
            test_value = current_value - dst_range_start + range.begin
            if range.cover?(test_value)
              current_value = test_value
              break
            end
          end
        end

        seed_range_match = false
        seed_ranges.each do |seed_range|
          if seed_range.cover?(current_value)
            seed_range_match = true
            break
          end
        end
        break if seed_range_match

        location += 1
      end
      return location
    end
  end
end

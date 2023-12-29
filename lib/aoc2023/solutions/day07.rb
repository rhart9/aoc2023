# frozen_string_literal: true

module Aoc2023
  class Day07
    def self.solve
      lines = File.readlines("input/day07.txt", chomp: true)

      # pt 1
      puts solve1(lines)

      # pt 2
      puts solve2(lines)
    end

    def self.solve1(lines)
      solve_work(lines, false)
    end

    def self.solve2(lines)
      solve_work(lines, true)
    end

    def self.solve_work(lines, jokers_f)
      val = 0
      @bids = []

      lines.each do |line|
        _, hand, bid = line.match(/(.*) (\d*)/).to_a
        @bids << {
          bid: bid,
          hand: hand
        }
      end

      @bids.sort! do |a, b|
        a_arr = a[:hand].split("")
        b_arr = b[:hand].split("")

        a_tally = a_arr.tally
        b_tally = b_arr.tally

        a_jokers = a_tally.filter { |k, _v| jokers_f && k == "J" }["J"].to_i
        b_jokers = b_tally.filter { |k, _v| jokers_f && k == "J" }["J"].to_i

        cmp = get_type_rank(a_tally.reject { |k, _v| jokers_f && k == "J" }.map(&:last).sort.reverse, a_jokers) <=> get_type_rank(b_tally.reject { |k, _v| jokers_f && k == "J" }.map(&:last).sort.reverse, b_jokers) # rubocop:disable Layout/LineLength
        if cmp.zero?
          5.times do |i|
            cmp = card_value(a_arr[i], jokers_f) <=> card_value(b_arr[i], jokers_f)
            unless cmp.zero?
              break
            end
          end
        end
        cmp
      end

      @bids.each_with_index do |bid, i|
        val += bid[:bid].to_i * (i + 1)
      end

      return val
    end

    def self.get_type_rank(counts_by_label, num_jokers)
      if num_jokers == 5 # five of a kind all jokers
        return 7
      end

      counts_by_label[0] += num_jokers

      if counts_by_label[0] == 5 # five of a kind
        7
      elsif counts_by_label[0] == 4 # four of a kind
        6
      elsif counts_by_label[0] == 3 && counts_by_label[1] == 2 # full house
        5
      elsif counts_by_label[0] == 3 # three of a kind
        4
      elsif counts_by_label[0] == 2 && counts_by_label[1] == 2 # two pair
        3
      elsif counts_by_label[0] == 2 # one pair
        2
      else # high card
        1
      end
    end

    def self.card_value(label, jokers_f)
      case label
      when "2".."9"
        label.to_i
      when "T"
        10
      when "J"
        jokers_f ? 0 : 11
      when "Q"
        12
      when "K"
        13
      when "A"
        14
      end
    end
  end
end

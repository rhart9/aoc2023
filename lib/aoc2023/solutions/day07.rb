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

        cmp = get_type_rank(a_arr.tally.map(&:last).sort.reverse) <=> get_type_rank(b_arr.tally.map(&:last).sort.reverse)
        if cmp.zero?
          5.times do |i|
            cmp = card_value(a_arr[i]) <=> card_value(b_arr[i])
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

    def self.solve2(lines)
      val = 0

      return val
    end

    def self.get_type_rank(counts_by_label)
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

    def self.card_value(label)
      case label
      when "2".."9"
        label.to_i
      when "T"
        10
      when "J"
        11
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

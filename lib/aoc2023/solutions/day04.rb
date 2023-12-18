# frozen_string_literal: true

module Aoc2023
  class Day04
    def self.solve
      lines = File.readlines("input/day04.txt", chomp: true)

      solutions = solve_work(lines)

      # pt 1
      puts solutions[:solution1]

      # pt 2
      puts solutions[:solution2]
    end

    def self.solve_work(lines)
      val = 0

      card_ctr = Hash.new(0)

      lines.each do |line|
        _, _, s_card_no, winning_nos_sect, your_nos_sect = line.match(/Card(\s+)(\d+): (.+) \| (.+)/).to_a
        card_no = s_card_no.to_i
        card_ctr[card_no] += 1

        winning_nos = winning_nos_sect.split(" ")
        your_nos = your_nos_sect.split(" ")

        num_matches = winning_nos.intersection(your_nos).length

        val += (2**(num_matches - 1)) if num_matches > 0 # rubocop:disable Style/NumericPredicate

        (card_no + 1..card_no + num_matches).each do |i|
          card_ctr[i] += card_ctr[card_no]
        end
      end

      return {
        solution1: val,
        solution2: card_ctr.values.sum
      }
    end

    def self.solve1(lines)
      return solve_work(lines)[:solution1]
    end

    def self.solve2(lines)
      return solve_work(lines)[:solution2]
    end
  end
end

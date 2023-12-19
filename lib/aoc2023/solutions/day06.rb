# frozen_string_literal: true

module Aoc2023
  class Day06
    def self.solve
      lines = File.readlines("input/day06.txt", chomp: true)

      # pt 1
      puts solve1(lines)

      # pt 2
      puts solve2(lines)
    end

    # find any n where n(T-n) > D
    # there are not many n values to check so it would be quick to brute force
    # but honestly how can I not try solving the quadratic equation

    # n(T-n) = D
    # nT-n^2 = D
    # n^2-nT+D = 0
    # n = T +/- sqrt(T^2-4*D)/2

    def self.solve1(lines)
      _, times_sect = lines[0].match(/Time:\s+(.*)/).to_a
      times = times_sect.split(/\s+/).map(&:to_i)
      _, distances_sect = lines[1].match(/Distance:\s+(.*)/).to_a
      distances = distances_sect.split(/\s+/).map(&:to_i)

      return solve_work(times, distances)
    end

    # pt 2 - good call, this would take much longer to brute force

    def self.solve2(lines)
      _, times_sect = lines[0].match(/Time:\s+(.*)/).to_a
      times = [times_sect.split(/\s+/).reduce(:+).to_i]
      _, distances_sect = lines[1].match(/Distance:\s+(.*)/).to_a
      distances = [distances_sect.split(/\s+/).reduce(:+).to_i]

      return solve_work(times, distances)
    end

    def self.solve_work(times, distances)
      val = 1

      times.each_with_index do |time, i|
        first_solution = (time.to_f - Math.sqrt((time**2) - (4 * distances[i]))) / 2
        second_solution = (time.to_f + Math.sqrt((time**2) - (4 * distances[i]))) / 2

        lower_bound = first_solution == first_solution.ceil ? first_solution.to_i + 1 : first_solution.ceil
        upper_bound = second_solution == second_solution.floor ? second_solution.to_i - 1 : second_solution.floor

        if lower_bound <= upper_bound
          val *= (upper_bound - lower_bound + 1)
        end
      end

      return val
    end
  end
end

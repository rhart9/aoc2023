# frozen_string_literal: true

module Aoc2023
  class Day02
    def self.solve
      lines = File.readlines("input/day02.txt")

      # pt 1
      puts solve1(lines)

      # pt 2
      puts solve2(lines)
    end

    def self.solve1(lines)
      max_colors = {
        red: 12,
        green: 13,
        blue: 14
      }

      val = 0

      lines.each do |line|
        invalid_game = false
        _, game_no, game_desc = line.match(/Game (\d*): (.*)/).to_a
        game_desc.split(";").to_a.each do |pull|
          pull.split(",").to_a.each do |color_info|
            _, cube_no, cube_color = color_info.match(/ *(\d*) (\w*)/).to_a

            if cube_no.to_i > max_colors[cube_color.to_sym]
              invalid_game = true
              break
            end
          end
        end

        unless invalid_game
          val += game_no.to_i
        end
      end

      return val
    end

    def self.solve2(lines)
      val = 0

      lines.each do |line|
        min_cubes = {
          red: 0,
          green: 0,
          blue: 0
        }

        _, _, game_desc = line.match(/Game (\d*): (.*)/).to_a
        game_desc.split(";").to_a.each do |pull|
          pull.split(",").to_a.each do |color_info|
            _, cube_no, cube_color = color_info.match(/ *(\d*) (\w*)/).to_a
            if cube_no.to_i > min_cubes[cube_color.to_sym]
              min_cubes[cube_color.to_sym] = cube_no.to_i
            end
          end
        end
        val += (min_cubes[:red] * min_cubes[:green] * min_cubes[:blue])
      end

      return val
    end
  end
end

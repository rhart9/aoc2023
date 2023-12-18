# frozen_string_literal: true

require "require_all"

require_relative "aoc2023/version"
require_rel "aoc2023/solutions"

module Aoc2023
  class Error < StandardError; end

  def self.run
    class_name = get_class_name(ARGV[0])

    aoc_object = Object.const_get(class_name)
    aoc_object.solve
  end

  # If day_num = nil, get class name for current day
  def self.get_class_name(day_num)
    class_match_pattern = "#{self.name}::Day" # rubocop:disable Style/RedundantSelf
    solution_classes = ObjectSpace.each_object(Class).to_a.map(&:name).select { |name| /#{class_match_pattern}(\d+)/.match?(name) }

    class_name = solution_classes.max

    unless day_num.nil?
      arg_class_name = "#{class_match_pattern}#{format("%02d", day_num)}"
      arg_classes = solution_classes.select { |name| name == arg_class_name }

      unless arg_classes.empty?
        class_name = arg_classes[0]
      end
    end

    return class_name
  end
end

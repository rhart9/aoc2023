# frozen_string_literal: true
#!/usr/bin/env ruby

require "thor"
require_relative "aoc2023"

class Generator < Thor::Group
  include Thor::Actions

  argument :day_num

  def self.source_root
    File.expand_path("../", File.dirname(__FILE__))
  end

  def create_inputs
    create_file("input/day#{day_num}.txt")
    create_file("input/day#{day_num}-test.txt")
  end

  def create_lib
    template("templates/day.rb.tt", "lib/aoc2023/solutions/day#{day_num}.rb")
  end

  def create_spec
    template("templates/day_spec.rb.tt", "spec/aoc2023/day#{day_num}_spec.rb")
  end
end

class_name = Aoc2023.get_class_name(nil)
day_num = class_name[class_name.length - 2..class_name.length]
Generator.start([format("%02d", day_num.to_i + 1)])

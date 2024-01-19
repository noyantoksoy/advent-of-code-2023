# frozen_string_literal: true

# Base class for solutions
class Solution
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def solve_part1
    raise NotImplementedError
  end

  def solve_part2
    raise NotImplementedError
  end
end

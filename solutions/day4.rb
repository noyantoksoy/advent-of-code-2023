# frozen_string_literal: true

require_relative 'base'

# Day 4 solution
class Day4 < Solution
  def solve_part1
    @input.reduce(0) do |sum, line|
      winning_numbers, your_numbers = line.split(': ')[1].split(' | ').map { |part| part.split(' ').map(&:to_i) }
      puts "Winning: #{winning_numbers.inspect}"
      puts "Yours: #{your_numbers.inspect}"
      puts "--------------"
      matches = your_numbers.reduce(0) do |match, number|
        match + (winning_numbers.include?(number) ? 1 : 0)
      end
      sum + (matches.zero? ? 0 : 2**(matches - 1))
    end
  end
end

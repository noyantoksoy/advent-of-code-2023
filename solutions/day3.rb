# frozen_string_literal: true

require_relative 'base'

# Day 3 solution
class Day3 < Solution

  def solve_part1
    part_numbers = []
    hash_of_numbers = @input.map { |line| get_hash_from_line(line) }
    @input.each_with_index do |line, index|
      symbols = line.enum_for(:scan, /[^.\d]/).map { Regexp.last_match.begin(0) }
      next if symbols.empty? # Doesn't affect any lines

      lines_to_affect = (index - 1..index + 1).to_a.filter { |i| i >= 0 && i < @input.length }
      symbols.each do |symbol_index|
        lines_to_affect.each do |affected_line|
          numbers_hash = hash_of_numbers[affected_line]
          check_symbol = symbol_index - 1
          while check_symbol <= symbol_index + 1
            if numbers_hash.key?(check_symbol)
              number_to_add = numbers_hash[check_symbol]
              part_numbers << number_to_add
              # part number added, remove it from hash to avoid duplicates
              # must also remove adjacent numbers
              start_index = check_symbol
              # move right
              while numbers_hash.key?(start_index)
                numbers_hash.delete(start_index)
                start_index += 1
              end
              # move left
              start_index = check_symbol - 1
              while numbers_hash.key?(start_index)
                numbers_hash.delete(start_index)
                start_index -= 1
              end
            end
            check_symbol += 1
          end
        end
      end
    end
    puts part_numbers.inspect
    part_numbers.sum
  end

  private

  def get_hash_from_line(line)
    hash = {}
    line.enum_for(:scan, /\d+/).map do |match|
      index = Regexp.last_match.begin(0)
      match.length.times { |i| hash[index + i] = match.to_i }
    end
    hash
  end
end

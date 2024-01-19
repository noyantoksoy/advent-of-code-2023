# frozen_string_literal: true

require_relative 'base'

# Day 1 solution
class Day1 < Solution
  def solve_part1
    @input.reduce(0) do |sum, line|
      digits = line.scan(/\d/)
      sum + (digits.empty? ? 0 : (digits.first + digits.last).to_i)
    end
  end

  def solve_part2
    written_digits = {
      'one' => '1',
      'two' => '2',
      'three' => '3',
      'four' => '4',
      'five' => '5',
      'six' => '6',
      'seven' => '7',
      'eight' => '8',
      'nine' => '9'
    }

    @input.reduce(0) do |sum, line|
      word_formed = ''
      digits = []
      line.each_char do |char|
        # Check if char is a digit
        if char =~ /\d/
          digits << char
          break
        else
          word_formed += char
          match = word_formed[/(?:#{written_digits.keys.join('|')})/]
          if match
            digits << written_digits[match]
            break
          end
        end
      end
      word_formed = ''
      line.each_char.reverse_each do |char|
        if char =~ /\d/
          digits << char
          break
        else
          word_formed = char + word_formed
          match = word_formed[/(?:#{written_digits.keys.join('|')})/]
          if match
            digits << written_digits[match]
            break
          end
        end
      end
      sum + (digits.empty? ? 0 : (digits.first + digits.last).to_i)
    end
  end
end

# frozen_string_literal: true

require_relative 'base'

# Day 2 solution
class Day2 < Solution
  def initialize(red:, green:, blue:)
    super
    @available_cubes = {
      'red' => red,
      'green' => green,
      'blue' => blue
    }
  end

  def solve_part1
    sum_of_ids = 0
    @input.each do |line|
      revealed_cubes = {
        'red' => 0,
        'green' => 0,
        'blue' => 0
      }
      game = parse_input(line)
      valid_game = catch(:done) do
        game.reveals.reduce(true) do |valid, reveal|
          revealed_cubes['red'] = reveal.red
          revealed_cubes['green'] = reveal.green
          revealed_cubes['blue'] = reveal.blue

          # check if we have enough cubes
          valid_reveal = revealed_cubes.none? do |color, count|
            count > @available_cubes[color]
          end
          throw(:done, false) unless valid && valid_reveal
          valid && valid_reveal
        end
      end
      sum_of_ids += game.id if valid_game
    end
    sum_of_ids
  end

  def solve_part2
    @input.reduce(0) do |sum, line|
      revealed_cubes = {
        'red' => 0,
        'green' => 0,
        'blue' => 0
      }
      game = parse_input(line)
      game.reveals.each do |reveal|
        revealed_cubes['red'] = reveal.red if reveal.red > revealed_cubes['red']
        revealed_cubes['green'] = reveal.green if reveal.green > revealed_cubes['green']
        revealed_cubes['blue'] = reveal.blue if reveal.blue > revealed_cubes['blue']
      end
      sum + revealed_cubes.values.reduce(:*)
    end
  end

  private

  def parse_input(line)
    _, id, reveals_part = line.split(/Game (\d+):/)
    game = Game.new(id: id.to_i)
    reveals_part.split('; ').each do |rv|
      reveal = Reveal.new
      rv.scan(/(\d+) (\w+)/).each do |number, color|
        reveal.send("#{color}=", number.to_i)
      end
      game.add_reveal(reveal)
    end
    game
  end

  class Game
    attr_accessor :id, :reveals

    def initialize(id:)
      @id = id
    end

    def add_reveal(reveal)
      @reveals ||= []
      @reveals << reveal
    end
  end

  class Reveal
    attr_accessor :red, :green, :blue

    def initialize
      @red = 0
      @green = 0
      @blue = 0
    end
  end
end

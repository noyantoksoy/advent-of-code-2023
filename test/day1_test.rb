# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../solutions/day1'

class Day1Test < Minitest::Test
  describe 'Day1' do
    subject { Day1.new('') }

    it 'should solve part1' do
      subject.input = File.readlines('test/inputs/day1.txt').map(&:chomp)
      assert_equal 54697, subject.solve_part1
    end

    it 'should solve part2' do
      subject.input = File.readlines('test/inputs/day1.txt').map(&:chomp)
      assert_equal 54885, subject.solve_part2
    end
  end
end

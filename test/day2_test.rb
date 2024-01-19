# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../solutions/day2'

class Day2Test < Minitest::Test
  describe 'Day2' do
    subject { Day2.new(red: 12, green: 13, blue: 14) }

    it 'should solve part1' do
      subject.input = File.readlines('test/inputs/day2.txt').map(&:chomp)
      assert_equal 346, subject.solve_part1
    end
  end
end

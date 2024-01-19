# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../solutions/day3'

class Day3Test < Minitest::Test
  describe 'Day3' do
    subject { Day3.new('') }

    it 'should solve part1' do
      subject.input = File.readlines('test/inputs/day3.txt').map(&:chomp)
      assert_equal 925, subject.solve_part1
    end
  end
end

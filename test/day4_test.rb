# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../solutions/day4'

class Day4Test < Minitest::Test
  describe 'Day4' do
    subject { Day4.new('') }

    it 'should solve part1' do
      subject.input = File.readlines('test/inputs/day4.txt').map(&:chomp)
      assert_equal 13, subject.solve_part1
    end
  end
end

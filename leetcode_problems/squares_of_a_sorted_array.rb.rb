require 'test/unit'
require 'pry'
class SquaresOfASortedArray < Test::Unit::TestCase

  #https://leetcode.com/problems/squares-of-a-sorted-array/

  def test_calc
    #Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

    input = [-4, -1, 0, 3, 10]
    output = [0, 1, 9, 16, 100]
    assert_equal(output,
                 sorted_squares(input))

    input = [-7, -3, 2, 3, 11]
    output = [4, 9, 9, 49, 121]
    assert_equal(output,
                 sorted_squares(input))
  end

  def sorted_squares(array)
    array.map { |n| n ** 2 }.sort
  end

end

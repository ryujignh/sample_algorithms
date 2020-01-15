require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class FibonacciSeriesBottomUp < Minitest::Test

  def test_calc
    assert_equal(3, fibonacci_bottom_up(4))
    assert_equal(5, fibonacci_bottom_up(5))
    assert_equal(34, fibonacci_bottom_up(9))
  end

  def fibonacci_bottom_up(n)
    #table = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    table = Array.new
    if n < 1
      return "Error!"
    end

    table[0] = 0
    table[1] = 1
    table[2] = 1

    (3..n).each do |i|
      table[i] = table[i - 1] + table[i - 2]
    end
    table[n]
  end

end

# Time Complexity = O(n)
# Space Complexity = O(n)

require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class ZeroOneKnapsack < Minitest::Test

  def test_calc
    s1 = "abcd"
    s2 = "abcf"
    assert_equal(1, solution([[]], s1, s2, 0, 0))
  end

  def solution(s1, s2)
    dp = [
      []
    ]

  end


end

# Time Complexity = O(n)
# Space Complexity = O(n)

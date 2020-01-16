require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class HouseThiefBottomUp < Minitest::Test

  def test_calc
    values = [6, 7, 1, 30, 8, 2, 4]
    assert_equal(41, get_max_value(values))
  end

  def get_max_value(values)
    dp = Array.new(values.size + 2, 0)
    dp[values.size] = 0
    (0..values.size - 1).to_a.reverse.each do |i|
      dp[i] = [values[i] + dp[i + 2], dp[i + 1]].max
    end
    dp[0]
  end

end

# Time Complexity = O(n)
# Space Complexity = O(n)

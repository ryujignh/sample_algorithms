require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class HouseThiefTopDown < Minitest::Test

  def test_calc
    values = [6, 7, 1, 30, 8, 2, 4]
    dp = Array.new(values.size, 0)
    assert_equal(41, get_max_value(dp, values))
  end

  def get_max_value(dp, values, current_index = 0)
    if current_index >= values.size
      return 0
    end

    if dp[current_index] == 0
      steel_current = values[current_index] + get_max_value(dp, values, current_index + 2)
      skip_current = get_max_value(dp, values, current_index + 1)
      dp[current_index] = [steel_current, skip_current].max
    end
    dp[current_index]
  end

end

# Time Complexity = O(n)
# Space Complexity = O(n)

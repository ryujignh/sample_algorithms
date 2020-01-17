require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class ZeroOneKnapsack < Minitest::Test

  def test_calc
    profits = [31, 26, 72, 17]
    weights = [3, 1, 5, 2]
    capacity = 7
    assert_equal(98, solution(profits, weights, capacity, 0))
  end

  def solution(profits, weights, capacity, current_index)
    if capacity <= 0 || current_index < 0 || current_index >= profits.size
      return 0
    end
    profit1 = 0
    # Taking current element
    if weights[current_index] <= capacity
      profit1 = profits[current_index] + solution(profits, weights, capacity - weights[current_index], current_index + 1)
    end
    # Not taking current element
    profit2 = solution(profits, weights, capacity, current_index + 1)

    [profit1, profit2].max
  end


end

# Time Complexity = O(n)
# Space Complexity = O(n)

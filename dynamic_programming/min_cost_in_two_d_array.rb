require 'test/unit'
require 'pry'
class MinCostInTwoDArray < Test::Unit::TestCase

  def test_calc
    array = [
        [4, 7, 8, 6, 4],
        [6, 7, 3, 9, 2],
        [3, 8, 1, 2, 4],
        [7, 1, 7, 3, 7],
        [2, 9, 8, 9, 3],
    ]
    dp = [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
    ]
    assert_equal(4 + 6 + 7 + 3 + 1 + 2 + 3 + 7 + 3, solution(dp, array, array.size - 1, array[0].size - 1))
  end

  def solution(dp, array, row, col)

    # If we at the end of the array
    puts "row: #{row}, col: #{col}"
    # Base case, at last cell
    if row == -1 || col == -1
      # Return Integer.MAX_VALUE
      return 4611686018427387903
    end

    # If we're at first cell(0, 0), then no need to recurs
    if row == 0 && col == 0
      return array[0][0]
    end

    # Case1: Get min array if we go 'up' from current cell
    if dp[row][col] == 0
      minCost1 = solution(dp, array, row - 1, col)
      minCost2 = solution(dp, array, row, col - 1)
      puts "minCost1: #{minCost1}, minCost2: #{minCost2}"
      minCost = [minCost1, minCost2].min

      currentCellsCost = array[row][col]

      dp[row][col] = minCost + currentCellsCost
    end
    binding.pry
    dp[row][col]
  end


end

require 'test/unit'
require 'pry'
class NumOfPaths < Test::Unit::TestCase

  def test_calc
    array = [
        [4, 7, 1, 6],
        [5, 7, 3, 9],
        [3, 2, 1, 2],
        [7, 1, 6, 3],
    ]
    cost = 25
    assert_equal(2, number_of_paths(array, array.size - 1, array[0].size - 1, cost))
  end

  def number_of_paths(array, row, col, cost)
    #dp = [
    #    [0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0],
    #]
    dp = Array.new(row + 1, Array.new(col + 1, 0))
    solution(dp, array, row, col, cost)
  end

  def solution(dp, array, row, col, cost)
    if cost < 0
      return 0
    end

    if row == 0 && col == 0
      return (array[0][0] - cost == 0) ? 1 : 0
    end

    if dp[row][col] == 0
      if row == 0 # Base case: At the first row, we can only go left
        dp[row][col] = number_of_paths(array, 0, col - 1, cost - array[row][col])
      elsif col == 0 # Base case: At the first column, we can only go up
        dp[row][col] = number_of_paths(array, row - 1, 0, cost - array[row][col])
      else
        # Case1: Get min cost if we go 'up' from current cell
        noOfPathsFromPreviousRow = number_of_paths(array, row - 1, col, cost - array[row][col])
        # Case2: Get min cost if we go 'left' from current cell
        noOfPathsFromPreviousCol = number_of_paths(array, row, col - 1, cost - array[row][col])
        dp[row][col] = noOfPathsFromPreviousRow + noOfPathsFromPreviousCol
      end
    end
    dp[row][col]
  end

end

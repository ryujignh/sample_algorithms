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
    assert_equal(2, solution(array, array.size - 1, array[0].size - 1, cost))
  end

  def solution(array, row, col, cost)
    if cost < 0
      return 0
    end

    if row == 0 && col == 0
      return (array[0][0] - cost == 0) ? 1 : 0
    end

    if row == 0
      return solution(array, 0, col - 1, cost - array[row][col])
    end

    if col == 0
      return solution(array, row - 1, 0, cost - array[row][col])
    end

    # Case1: Get min cost if we go 'up' from current cell
    noOfPathsFromPreviousRow = solution(array, row - 1, col, cost - array[row][col])

    # Case2: Get min cost if we go 'left' from current cell
    noOfPathsFromPreviousCol = solution(array, row, col - 1, cost - array[row][col])

    noOfPathsFromPreviousRow + noOfPathsFromPreviousCol
  end

end

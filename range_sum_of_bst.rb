#Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
#The binary search tree is guaranteed to have unique values.
#The number of nodes in the tree is at most 10000.
#The final answer is guaranteed to be less than 2^31.

require 'test/unit'

class RangeSumOfBst < Test::Unit::TestCase

  def test_calc
    root = [10, 5, 15, 3, 7, nil, 18]
    l = 7
    r = 15
    output = 32
    assert(output == range_sum_bst(root, l, r))

    root = [10, 5, 15, 3, 7, 13, 18, 1, nil, 6]
    l = 6
    r = 10
    output = 23
    assert(output == range_sum_bst(root, l, r))
  end

  output = 0
  def range_sum_bst(root, l, r)

    if root.val < l
      range_sum_bst(root.right, l, r)
    elsif root.val > r
      range_sum_bst(root.left, l, r)
    else
      output += root.val
      range_sum_bst(root.left, l, r)
      range_sum_bst(root.right, l, r)
    end
    output

  end

end
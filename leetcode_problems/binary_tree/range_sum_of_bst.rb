#Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
#The binary search tree is guaranteed to have unique values.
#The number of nodes in the tree is at most 10000.
#The final answer is guaranteed to be less than 2^31.

require 'test/unit'

# https://qiita.com/ryujignh/items/6666b70bdc5aa8751af2
# Qiita: https://qiita.com/ryujignh/items/6666b70bdc5aa8751af2

class RangeSumOfBst < Test::Unit::TestCase

  def test_range_sum_bst
    #  TODO: Add test
  end


  def range_sum_bst(root, l, r)
    result = 0
    unless root.nil?
      puts result

      result += root.val if root.val >= l && root.val <= r
      result += range_sum_bst(root.right, l, r) unless root.right.nil?
      result += range_sum_bst(root.left, l, r) unless root.left.nil?
    end
    result
  end

end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end
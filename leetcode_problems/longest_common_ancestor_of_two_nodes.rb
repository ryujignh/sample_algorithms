require 'minitest/autorun'
require 'pry'
class LongestCommonAncestorOfTwoNodes < Minitest::Test

  def test_run
    root = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
    p = 5
    q = 1

    tree = TreeNode.new(3)
    tree.left = TreeNode.new(5)
    tree.left.left = TreeNode.new(6)
    tree.left.right = TreeNode.new(2)
    tree.left.right.right = TreeNode.new(4)
    tree.left.right.left = TreeNode.new(7)

    tree.right = TreeNode.new(1)
    tree.right.left = TreeNode.new(0)
    tree.right.right = TreeNode.new(8)
    assert_equal(3, lowest_common_ancestor(tree, p, q))
  end

  def lowest_common_ancestor(root, p, q)
    return nil if root.nil?

    if root.val == p || root.val == q
      return root
    end

    left = lowest_common_ancestor(root.left, p, q)
    right = lowest_common_ancestor(root.right, p, q)

    if left != nil && right != nil
      root
    else
      left ? left : right
    end
  end

end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

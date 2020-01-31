require 'test/unit'
require 'pry'
class IsSymmetric < Test::Unit::TestCase

  def test_is_symmetric

    [1, 2, 2, 3, 4, 4, 3]

    tree = TreeNode.new(1)
    tree.left = TreeNode.new(2)
    tree.left.left = TreeNode.new(3)
    tree.left.right = TreeNode.new(4)
    tree.right = TreeNode.new(2)
    tree.right.left = TreeNode.new(4)
    tree.right.right = TreeNode.new(3)

    [1, 2, 2, nil, 3, nil, 3]
    tree = TreeNode.new(1)
    tree.left = TreeNode.new(2)
    tree.left.right = TreeNode.new(3)
    tree.right = TreeNode.new(2)
    tree.right.right = TreeNode.new(3)

    assert(!is_symmetric(tree))
  end

  def is_symmetric(tree)
    tree.nil? || check(tree.left, tree.right)
  end

  def check(left_subtree, right_subtree)
    if left_subtree.nil? && right_subtree.nil?
      true
    elsif left_subtree && right_subtree
      left_subtree.val == right_subtree.val &&
          check(left_subtree.left, right_subtree.right) &&
          check(left_subtree.right, right_subtree.left)
    else
      false
    end
  end

end


# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end
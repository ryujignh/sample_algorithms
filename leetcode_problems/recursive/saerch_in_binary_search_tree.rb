require 'minitest/autorun'
require 'pry'
class SearchInBinarySearchTree < Minitest::Test

  def test_run

    root = TreeNode.new(4)
    root.left = TreeNode.new(2)
    root.left.left = TreeNode.new(1)
    root.left.right = TreeNode.new(3)
    root.right = TreeNode.new(7)

    expected_root = TreeNode.new(2)
    expected_root.left = TreeNode.new(1)
    expected_root.right = TreeNode.new(3)

    result = search_bst(root, 2)

    assert_equal(2, result.val)
    assert_equal(1, result.left.val)
    assert_equal(3, result.right.val)

    result = search_bst(root, 10)
    assert_equal(nil, result.val)
  end

  def search_bst(root, val)
    return TreeNode.new(nil) if root.nil?
    return root if root.val == val
    if val > root.val
      search_bst(root.right, val)
    else
      search_bst(root.left, val)
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
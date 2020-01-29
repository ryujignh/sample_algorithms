require 'test/unit'
require 'pry'
class InOrderTraversal < Test::Unit::TestCase

  def test_run

    input = [1, nil, 2, 3]

    tree = TreeNode.new(1)
    tree.left = TreeNode.new(nil)
    tree.right = TreeNode.new(2)
    tree.right.left = TreeNode.new(3)
    assert_equal([1, 3, 2],
                 inorder_traversal(tree))

    assert_equal([],
                 inorder_traversal(nil))
  end

  def inorder_traversal(root, result = [])
    if root == nil || root.val.nil?
      return []
    end

    inorder_traversal(root.left, result) if root.left
    result << root.val
    inorder_traversal(root.right, result) if root.right
    result
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
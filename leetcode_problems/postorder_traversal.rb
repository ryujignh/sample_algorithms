require 'test/unit'
require 'pry'
class PostOrderTraversal < Test::Unit::TestCase

  def test_run

    input = [1, nil, 2, 3]

    tree = TreeNode.new(1)
    tree.left = TreeNode.new(nil)
    tree.right = TreeNode.new(2)
    tree.right.left = TreeNode.new(3)
    assert_equal([3, 2, 1],
                 postorder_traversal(tree))

    assert_equal([],
                 postorder_traversal(nil))
  end

  def postorder_traversal(root, result = [])
    if root == nil || root.val.nil?
      return []
    end

    postorder_traversal(root.left, result) if root.left
    postorder_traversal(root.right, result) if root.right
    result << root.val
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
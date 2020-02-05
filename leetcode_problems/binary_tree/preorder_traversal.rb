require 'test/unit'
require 'pry'
class PreOrderTraversal < Test::Unit::TestCase

  def test_run

    input = [1,nil,2,3]

    tree = TreeNode.new(1)
    tree.left = TreeNode.new(nil)
    tree.right = TreeNode.new(2)
    tree.right.left = TreeNode.new(3)
    assert_equal([1,2,3],
                 preorder_traversal(tree))

    assert_equal([],
                 preorder_traversal(nil))
  end

  def preorder_traversal(root, result = [])
    return result if root.nil?
    result << root.val unless root.val.nil?
    preorder_traversal(root.left, result) unless root.left.nil?
    preorder_traversal(root.right, result) unless root.right.nil?
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
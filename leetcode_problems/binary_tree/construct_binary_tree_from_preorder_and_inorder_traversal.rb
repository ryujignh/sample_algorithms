require 'minitest/autorun'
require 'pry'
class ConstructBinaryTreeFromInorderAndPostorderTraversal < Minitest::Test

  def test_run
    preorder = [3, 9, 20, 15, 7]
    inorder = [9, 3, 15, 20, 7]

    tree = TreeNode.new(3)
    tree.left = TreeNode.new(9)
    tree.right = TreeNode.new(20)
    tree.right.left = TreeNode.new(15)
    tree.right.right = TreeNode.new(7)
    tree
    assert_equal(tree, build_tree(preorder, inorder))
  end

  def build_tree(preorder, inorder)
    pre_i = preorder.first
    return nil if pre_i.nil?

    node = TreeNode.new(pre_i)

    i = inorder.index(pre_i)

    node.left = build_tree(preorder[1..i], inorder[0...i])
    node.right = build_tree(preorder[i + 1..-1], inorder[i+1..-1])

    node
  end

end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

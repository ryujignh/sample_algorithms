require 'test/unit'
require 'pry'
class ConstructBinaryTreeFromInOrderAndPostorderTraversal < Test::Unit::TestCase

  def test_construct_bst

    inorder = [9, 3, 15, 20, 7]
    postorder = [9, 15, 7, 20, 3]

    tree = TreeNode.new(3)
    tree.left = TreeNode.new(9)
    tree.right = TreeNode.new(20)
    tree.right.left = TreeNode.new(15)
    tree.right.right = TreeNode.new(7)
    assert_equal(tree,
                build_tree(inorder, postorder))
    #
    # inorder = [2, 1]
    # postorder = [2, 1]
    # test = build_tree(inorder, postorder)
    #
    # inorder = [1, 2]
    # postorder = [2, 1]
    # test = build_tree(inorder, postorder)
  end

  def build_tree(inorder, postorder)
    post_i = postorder.last
    return nil if post_i.nil?

    node = TreeNode.new(post_i)
    i = inorder.index(post_i)

    node.left = build_tree(inorder[0...i], postorder[0...i])
    node.right = build_tree(inorder[i+1..-1], postorder[i...-1])
    node

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
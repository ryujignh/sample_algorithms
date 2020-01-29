require 'test/unit'
require 'pry'
class MaximumDepthOfBinaryTree < Test::Unit::TestCase

  #https://leetcode.com/problems/maximum-depth-of-binary-tree/

  def test_max_depth

    #[3,9,20,null,null,15,7]

    tree = TreeNode.new(3)
    tree.left = TreeNode.new(9)
    tree.right = TreeNode.new(20)
    tree.right.left = TreeNode.new(15)
    tree.right.right = TreeNode.new(7)

    assert_equal(3,
                 max_depth(tree))
  end

  #Recursively calculate the height of the tree to the left of the root.
  #Recursively calculate the height of the tree to the right of the root.
  #Pick the larger height from the two answers and add one to it (to account for the root node).
  def max_depth(root)
    if root == nil
      return 0
    end

    puts "root: #{root.val}"
    leftDepth = max_depth(root.left)
    rightDepth = max_depth(root.right)
    puts "leftDepth: #{leftDepth} rightDepth: #{rightDepth}"
    puts "leftDepth > rightDepth: #{leftDepth > rightDepth}"


    if leftDepth > rightDepth
      return leftDepth + 1
    else
      return rightDepth + 1
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
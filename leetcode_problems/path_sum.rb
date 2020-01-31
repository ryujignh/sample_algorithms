require 'test/unit'
require 'pry'
class PathSum < Test::Unit::TestCase

  def test_has_path_sum

    #[1, 2, 2, 3, 4, 4, 3]

    tree = TreeNode.new(5)
    tree.left = TreeNode.new(4)
    tree.left.left = TreeNode.new(11)
    tree.left.left.left = TreeNode.new(7)
    tree.left.left.right = TreeNode.new(2)
    tree.right = TreeNode.new(8)
    tree.right.left = TreeNode.new(13)
    tree.right.right = TreeNode.new(4)
    tree.right.right.right = TreeNode.new(1)

    assert(has_path_sum(tree, 22))
    assert(!has_path_sum(tree, 25123123))
  end

  def has_path_sum(node, sum)
    return false if node.nil?

    # Checking if node is a root node
    if node.left.nil? && node.right.nil?
      # If root's value is sum, we got the answer!
      if node.val == sum
        return true
      else
        return false
      end
    end

    if has_path_sum(node.left, sum - node.val)
      return true
    end

    if has_path_sum(node.right, sum - node.val)
      return true
    end

    false
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
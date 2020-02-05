require 'test/unit'
require 'pry'
class LevelOrderTraversal < Test::Unit::TestCase

  def test_run

    tree = TreeNode.new(3)
    tree.left = TreeNode.new(9)
    tree.right = TreeNode.new(20)
    tree.right.left = TreeNode.new(15)
    tree.right.right = TreeNode.new(7)
    assert_equal([
                     [3],
                     [9, 20],
                     [15, 7]
                 ],
                 levelorder_traversal(tree))

    assert_equal([],
                 levelorder_traversal(nil))
  end

  def levelorder_traversal(root)
    result = []
    return result if root.nil?

    queue = []
    queue << root

    until queue.empty?
      level = []
      level_size = queue.size
      level_size.times do
        node = queue.shift
        level << node.val
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?
      end
      result << level
    end
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
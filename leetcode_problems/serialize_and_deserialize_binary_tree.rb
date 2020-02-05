require 'minitest/autorun'
require 'pry'
class SerializeAndDeserializeBinaryTree < Minitest::Test

  def test_run
    expected = [1, 2, 3, nil, nil, 4, 5]
    tree = TreeNode.new(1)
    tree.left = TreeNode.new(2)
    tree.right = TreeNode.new(3)
    tree.right.left = TreeNode.new(4)
    tree.right.right = TreeNode.new(5)

    serialized_tree = "12XX34XX5XX"
    assert_equal(serialized_tree,
                 serialize(tree))
    deserialize(serialized_tree)
  end

  def serialize(root)
    return "X" if root.nil?

    root.val

    left = serialize(root.left)
    right = serialize(root.right)
    root.val.to_s + left.to_s + right.to_s
  end

  def deserialize(serialized_tree)
    nodes_left = serialized_tree.split('')
    deserialize_helpder(nodes_left)
  end

  def deserialize_helpder(nodes_left)
    value_for_node = nodes_left.shift
    return nil if value_for_node == "X"

    new_node = TreeNode.new(value_for_node)
    new_node.left = deserialize_helpder(nodes_left)
    new_node.right = deserialize_helpder(nodes_left)
    new_node
  end

end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

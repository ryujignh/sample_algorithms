class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def self.traverse_left(node)
    return if node.nil?
    puts node.value
    TreeNode.traverse_left(node.left)
  end

  def self.traverse_right(node)
    return if node.nil?
    puts node.value
    TreeNode.traverse_right(node.right)
  end

end

tree = TreeNode.new(5)
tree.left = TreeNode.new(3)
tree.right = TreeNode.new(8)
#tree.left.left = TreeNode.new(5)

TreeNode.traverse_left(tree)
TreeNode.traverse_right(tree)
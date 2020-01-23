require 'test/unit'
require 'pry'
class ConstructStringFromBinaryTree < Test::Unit::TestCase

  #https://leetcode.com/problems/construct-string-from-binary-tree/

  def test_calc
    # You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.
    # The null node needs to be represented by empty parenthesis pair "()".
    # And you need to omit all the empty parenthesis pairs that
    # don't affect the one-to-one mapping relationship between the string and the original binary tree.
    #
    # Input: Binary tree: [1,2,3,4]
    # Output: "1(2(4))(3)"
    # Explanation: Originallay it needs to be "1(2(4)())(3()())",
    # but you need to omit all the unnecessary empty parenthesis pairs.
    # And it will be "1(2(4))(3)".
    #
    #

    input = [1, 2, 3, 4]
    tree = TreeNode.new(1)
    tree.left = TreeNode.new(2)
    tree.right = TreeNode.new(3)
    tree.left.left = TreeNode.new(4)
    tree
    output = "1(2(4))(3)"

    assert_equal(output, tree2str(tree))

    input = [1, 2, 3, nil, 4]
    output = "1(2()(4))(3)"
    tree = TreeNode.new(1)
    tree.left = TreeNode.new(2)
    tree.right = TreeNode.new(3)
    tree.left.left = TreeNode.new(nil)
    tree.left.right = TreeNode.new(4)

    assert_equal(output, tree2str(tree))


    tree= TreeNode.new(1)
    output = "1"
    assert_equal(output, tree2str(tree))

    tree= TreeNode.new(nil)
    output = ""
    assert_equal(output, tree2str(tree))
  end

  def tree2str(t)
    @str = ''
    solution(t)
  end

  def solution(t)
    if t == nil
      return ""
    end

    @str += t.val.to_s

    # If leef node, then return
    if t.left == nil && t.right == nil
      return @str
    end

    # for left subtree
    @str += '('
    solution(t.left)
    @str += ')'

    # Only if right child is present to avoid extra parenthesis
    if t.right != nil
      @str += '('
      solution(t.right)
      @str += ')'
    end
    @str
  end

end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

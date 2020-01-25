require 'test/unit'
require 'pry'
class MergeTwoBinaryTrees < Test::Unit::TestCase

  # https://leetcode.com/problems/merge-two-binary-trees/
  # Qiita: https://qiita.com/ryujignh/items/c7b7294916d0e5540196

  # Definition for a binary tree node.
  # class TreeNode
  #     attr_accessor :val, :left, :right
  #     def initialize(val)
  #         @val = val
  #         @left, @right = nil, nil
  #     end
  # end

  # @param {TreeNode} t1
  # @param {TreeNode} t2
  # @return {TreeNode}
  #
  def test_calc
    #TODO: Add test case
  end

  def merge_trees(t1, t2)
    if t1.nil?
      return t2
    end
    if t2.nil?
      return t1
    end

    t1.val = t1.val.to_i + t2.val.to_i
    t1.left = merge_trees(t1.left, t2.left)
    t1.right = merge_trees(t1.right, t2.right)
    return t1

  end
end

class TreeNode

  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

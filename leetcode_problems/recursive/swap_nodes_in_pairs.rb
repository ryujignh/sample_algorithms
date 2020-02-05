require 'minitest/autorun'
require 'pry'
class SwapNodesInPairs < Minitest::Test

  def test_run
    list = ListNode.new(1)
    list.next = ListNode.new(2)
    list.next.next = ListNode.new(3)
    list.next.next.next = ListNode.new(4)
    new_list = swap_pairs(list)
    assert_equal(2, new_list.val)
    assert_equal(1, new_list.next.val)
    assert_equal(4, new_list.next.next.val)
    assert_equal(3, new_list.next.next.next.val)


    list = ListNode.new(1)
    new_list = swap_pairs(list)
    assert_equal(1, new_list.val)
  end

  def swap_pairs(head)
    return if head.nil?
    return head if head.next.nil?
    head_val = head.val
    next_head_val = head.next.val
    head.val = next_head_val
    head.next.val = head_val
    swap_pairs(head.next.next)
    head

  end

end

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

end
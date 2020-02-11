require 'minitest/autorun'
require 'pry'
class ReverseLinkedList < Minitest::Test

  def test_run
    # Input: 1->2->3->4->5->NULL
    # Output: 5->4->3->2->1->NULL
    head = ListNode.new(1)
    head.next = ListNode.new(2)
    head.next.next = ListNode.new(3)
    head.next.next.next = ListNode.new(4)
    head.next.next.next.next = ListNode.new(5)
    new_head = reverse_list(head)
    assert_equal(5, new_head.val)
    assert_equal(4, new_head.next.val)
    assert_equal(3, new_head.next.next.val)
    assert_equal(2, new_head.next.next.next.val)
    assert_equal(1, new_head.next.next.next.next.val)
    assert_equal(nil, new_head.next.next.next.next.next)
  end

  def reverse_list(head)
    return head if head.nil? || head.next.nil?

    p = head
    q = p.next
    q = reverse_list(q)

    # qはp.nextなので、p.next.next = p は q.next = pと同じ。なので、この行でq.nextが決まる。
    p.next.next = p
    p.next = nil
    q
  end

end

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

end
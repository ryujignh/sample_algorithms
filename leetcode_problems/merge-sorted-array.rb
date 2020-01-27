require 'test/unit'
require 'pry'
class MergeSortedArray < Test::Unit::TestCase

  #https://leetcode.com/problems/merge-sorted-array/

  def test_calc
    nums1 = [1, 2, 3, 0, 0, 0]
    m = 3
    nums2 = [2, 5, 6]
    n = 3

    output = [1, 2, 2, 3, 5, 6]
    assert_equal(output,
                 merge(nums1, m, nums2, n))
  end

  def merge(nums1, m, nums2, n)
    (nums1 + nums2).select { |number| number > 0 }.sort
  end

end

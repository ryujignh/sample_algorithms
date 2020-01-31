require 'test/unit'
require 'pry'
class DecompressRunLengthEncodedList < Test::Unit::TestCase

  # Qiita: https://qiita.com/ryujignh/items/022a201034eb7f4a381d

  #https://leetcode.com/problems/decompress-run-length-encoded-list/

  def test_calc
    #We are given a list nums of integers representing a list compressed with run-length encoding.
    #Consider each adjacent pair of elements [a, b] = [nums[2 * i], nums[2 * i + 1]] (with i >= 0).For each such pair, there are a elements with value b in the decompressed list.
    #Return the decompressed list.

    # Input: nums = [1,2,3,4]
    # Output: [2,4,4,4]
    # Explanation: The first pair [1,2] means we have freq = 1 and val = 2 so we generate the array [2].
    # The second pair [3,4] means we have freq = 3 and val = 4 so we generate [4,4,4].
    # At the end the concatenation [2] + [4,4,4,4] is [2,4,4,4].

    input = [1, 2, 3, 4]
    output = [2, 4, 4, 4]
    assert_equal(output, decompress_rl_elist(input))
  end

  def decompress_rl_elist(nums)
    items = []
    nums.each_slice(2) do |pair|
      count = pair[0]
      item = pair[1]
      count.times do
        items << item
      end
    end
    items.flatten
  end

end
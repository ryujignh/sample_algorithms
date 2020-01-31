require 'test/unit'
require 'pry'
class StringCompression < Test::Unit::TestCase

  #https://leetcode.com/problems/string-compression/

  def test_calc
    #Given an array of characters, compress it in-place.
    #The length after compression must always be smaller than or equal to the original array.
    #Every element of the array should be a character (not int) of length 1.
    #After you are done modifying the input array in-place, return the new length of the array.

    #Follow up:
    #Could you solve it using only O(1) extra space?
    #
    #
    # Input: ["a","a","b","b","c","c","c"]
    #Output: #Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
    #Explanation:
    #"aa" is replaced by "a2". "bb" is replaced by "b2". "ccc" is replaced by "c3".

    input = ["a", "a", "b", "b", "c", "c", "c"]
    output = ["a", "2", "b", "2", "c", "3"]
    assert_equal(output, compress(input))

    input = ["a"]
    output = ["a", "1"]
    assert_equal(output, compress(input))

    input = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
    output = ["a", "1"]
    assert_equal(output, compress(input))
  end

  def compress(chars)
    map = {}
    chars.each do |char|
      map[char] ||= 0
      map[char] += 1
    end
    map = Hash[map.collect { |k, v| [k, v.to_s] }]
    map.flatten
  end

end

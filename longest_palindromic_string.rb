require 'test/unit'
require 'pry'
class LongestPalindromicString < Test::Unit::TestCase

  def test_calc
    string = 'ABCYRCFBTUA'
    assert_equal(1, solution(string, 0, string.size - 1))

    string = 'ABCCBUA'
    assert_equal(4, solution(string, 0, string.size - 1))
  end

  def solution(string, start_index, end_index)

    # Base case - if we have traversed more than 1/2 of string then return 0 as we don't need to process it
    if start_index > end_index
      return 0
    end

    # Base case - if both the index are at same position then its a palindrome as its 1 character
    if start_index == end_index
      return 1
    end
    c1 = 0

    if string[start_index] == string[end_index]
      # Add 2 to the existing known palindrome length only if remaining string is a palindrome too
      remaining_length = end_index - start_index + 1

      # Ex: MQADASM
      if remaining_length == solution(string, start_index + 1, end_index - 1)
        c1 = remaining_length + 2
      end
    end

    c2 = solution(string, start_index + 1, end_index)
    c3 = solution(string, start_index, end_index - 1)

    [c1 [c2, c3].max].max

  end

end

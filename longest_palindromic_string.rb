require 'test/unit'
require 'pry'
class LongestPalindromicString < Test::Unit::TestCase

  def test_calc
    string = 'ABCYRCFBTUA'
    assert_equal(1, solution(string, 0, string.size - 1))

    string = 'ABCCBUA'
    assert_equal(4, solution(string, 0, string.size - 1))
  end

  def solution(string, startIndex, endIndex)

    # Base case - if we have traversed more than 1/2 of string then return 0 as we don't need to process it
    if startIndex > endIndex
      return 0
    end

    # Base case - if both the index are at same position then its a palindrome as its 1 character
    if startIndex == endIndex
      return 1
    end
    c1 = 0

    if string[startIndex] == string[endIndex]
      # Add 2 to the existing known palindrome length only if remaining string is a palindrome too
      remainingLength = endIndex - startIndex + 1

      # Ex: MQADASM
      if remainingLength == solution(string, startIndex + 1, endIndex - 1)
        c1 = remainingLength + 2
      end
    end

    c2 = solution(string, startIndex + 1, endIndex)
    c3 = solution(string, startIndex, endIndex - 1)

    [c1 [c2, c3].max].max

  end

end

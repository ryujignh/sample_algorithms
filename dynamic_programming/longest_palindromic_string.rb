require 'test/unit'
require 'pry'
class LongestPalindromicString < Test::Unit::TestCase

  def test_calc
    string = 'ABCYRCFBTUA'
    dp = Array.new(string.size, Array.new(string.size, nil))
    assert_equal(1, solution(dp, string, 0, string.size - 1))

    #string = 'ABCCBUA'
    #dp = Array.new(string.size, Array.new(string.size))
    #assert_equal(4, solution(dp, string, 0, string.size - 1))
  end

  def solution(dp, string, start_index, end_index)
    # Base case - if we have traversed more than 1/2 of string then return 0 as we don't need to process it
    if start_index > end_index
      return 0
    end
    # Base case - if both the index are at same position then its a palindrome as its 1 character
    if start_index == end_index
      return 1
    end

    c3 = 0
    if dp[start_index][end_index] == nil
      if string[start_index] == string[end_index]
        # Add 2 to the existing known palindrome length only if remaining string is a palindrome too
        c3 = 2 + solution(dp, string, start_index + 1, end_index - 1)
      end
      c1 = solution(dp, string, start_index + 1, end_index)
      c2 = solution(dp, string, start_index, end_index - 1)
      dp[start_index][end_index] = [c3, [c1, c2].max].max
    end

    dp[start_index][end_index]

  end

end

require 'test/unit'
require 'pry'
class LongestPalindromicSubsequenceTopdown < Test::Unit::TestCase

  def test_calc
    string = 'ELRMENMET'
    dp = Array.new(string.size, Array.new(string.size))
    assert_equal(5, calc(dp, string, 0, string.size - 1))
  end

  def calc(dp, string, startIndex, endIndex)

    # If we have traversed more than 1/2 of string then return 0 as we don't need to process it
    if startIndex > endIndex
      return 0
    end

    # If both the index are at same position then its a palindrome as its 1 character
    if startIndex == endIndex
      return 1
    end

    count1 = 0

    if dp[startIndex][endIndex] == nil

      # Case1: If index pointed characters matches then we add 2 to the existing known palindrome length
      if string[startIndex] == string[endIndex]
        count1 = 2 + calc(dp, string, startIndex + 1, endIndex - 1)
      end

      # Case2: Skip one element from beginning
      count2 = calc(dp, string, startIndex + 1, endIndex)

      # Case3: Skip one element from end
      count3 = calc(dp, string, startIndex, endIndex - 1)

      dp[startIndex][endIndex] = [count1, [count2, count3].max].max
    end

    dp[startIndex][endIndex]

  end

end

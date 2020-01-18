require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class LongestCommonSubsequence < Minitest::Test

  def test_calc
    s1 = "abcdef"
    s2 = "aecdef"
    #dp = Array.new([s1, s2].max.size, [])
    dp1 = Array.new(s1.size)
    dp2 = Array.new(s2.size)
    dp = Array.new(s2.size)
    (0..s1.size).each do |i|
      (0..s2.size).each do |j|
        dp[i][j] = -1
      end
    end
    #dp = [
    #    [],
    #    [],
    #    [],
    #    [],
    #    [],
    #    [],
    #]
    assert_equal(5, findCSLengthAux(dp, s1, s2))

    #s1 = "abc"
    #s2 = "aecdef"
    #assert_equal(2, findCSLengthAux(s1, s2))
    #
    #s1 = "abc"
    #s2 = "abc"
    #assert_equal(3, findCSLengthAux(s1, s2))
  end

  def findCSLengthAux(dp, s1, s2, i1 = 0, i2 = 0)
    if (i1 == s1.size) || (i2 == s2.size)
      return 0
    end

    if dp[i1][i2] == nil

      if s1[i1] == s2[i2]
        dp[i1][i2] = 1 + findCSLengthAux(dp, s1, s2, i1 + 1, i2 + 1)
        return [i1][i2]
      else
        # Increase index of 2nd string
        c1 = findCSLengthAux(dp, s1, s2, i1, i2 + 1)

        # Increase index of 1nd string
        c2 = findCSLengthAux(dp, s1, s2, i1 + 1, i2)
        dp[i1][i2] = [c1, c2].max
      end

    end

    dp[i1][i2]
  end

end

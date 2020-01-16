require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class ConvertOneStringToAnother < Minitest::Test

  def test_calc
    s1 = "abcd"
    s2 = "abcf"
    assert_equal(1, solution([[]], s1, s2, 0, 0))
  end

  def solution(dp, s1, s2, i1, i2)
    if dp[i1][i2] == nil
      if i1 == s1.size
        dp[i1][i2] = s2.size - i2
      elsif i2 == s2.size
        dp[i1][i2] = s1.size - i1
      elsif s1[i1] == s2[i2]
        dp[i1][i2] = solution(dp, s1, s2, i1 + 1, i2 + 1)
      else
        # Delete
        c1 = solution(dp, s1, s2, i1 + 1, i2)
        # Insert
        c2 = solution(dp, s1, s2, i1, i2 + 1)
        # Replace
        c3 = solution(dp, s1, s2, i1 + 1, i2 + 1)
      end
      dp[i1][i2] = 1 + [c1, [c2, c3].min].min
    end

    dp[i1][i2]

  end


end

# Time Complexity = O(n)
# Space Complexity = O(n)

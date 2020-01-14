require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class LongestCommonSubsequence < Minitest::Test

  def test_calc
    s1 = "abcdef"
    s2 = "aecdef"
    assert_equal(5, findCSLengthAux(s1, s2))

    s1 = "abc"
    s2 = "aecdef"
    assert_equal(2, findCSLengthAux(s1, s2))

    s1 = "abc"
    s2 = "abc"
    assert_equal(3, findCSLengthAux(s1, s2))
  end

  def findCSLengthAux(s1, s2, i1 = 0, i2 = 0)
    if i1 == s1.size || i2 == s2.size
      return 0
    end

    c1 = 0
    c2 = 0
    c3 = 0

    if s1[i1] == s2[i2]
      puts "getting c1"
      c1 = 1 + findCSLengthAux(s1, s2, i1 + 1, i2 + 1)
    else
      # Increase index of 2nd string
      puts "getting c2"
      c2 = findCSLengthAux(s1, s2, i1, i2 + 1)
      # Increase index of 1nd string
     puts "getting c3"
      c3 = findCSLengthAux(s1, s2, i1 + 1, i2)
    end

    [c1, c2, c3].max
  end

end

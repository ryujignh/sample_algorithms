require 'test/unit'
require 'pry'
class JewelsAndStones < Test::Unit::TestCase

  #771. Jewels and Stones
  #https://leetcode.com/problems/jewels-and-stones/

  # You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
  # Each character in S is a type of stone you have.
  # You want to know how many of the stones you have are also jewels.
  # The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
  def test_calc
    #Explanation:
    #Product of digits = 2 * 3 * 4 = 24
    #Sum of digits = 2 + 3 + 4 = 9
    #Result = 24 - 9 = 15

    #Input : J = "aA", S = "aAAbbbb"
    test_cases = [
        {j: "aA", s: "aAAbbbb", output: 3},
        {j: "z", s: "ZZ", output: 0},

    ].each do |test_case|
      assert_equal(test_case[:output],
                   num_jewels_in_stones(test_case[:j], test_case[:s]))
    end
  end

  def num_jewels_in_stones(j, s)
    s.gsub(/[^#{j}]/, '').size
  end

end

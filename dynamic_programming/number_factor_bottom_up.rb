require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class NumberFactorTopDown < Minitest::Test

  def test_calc
    assert_equal(6, ways_to_get_n(5))
    assert_equal(15, ways_to_get_n(7))
  end

  def ways_to_get_n(n)
    results = Array.new(n + 1)
    results[0] = results[1] = results[2] = 1
    results[3] = 2

    (4..n).each do |i|
      results[i] = results[i - 1] + results[i - 3] + results[i - 4]
    end
    results[n]
  end

end

# Time Complexity = O(n)
# Space Complexity = O(n)

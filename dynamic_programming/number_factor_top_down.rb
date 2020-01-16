require 'minitest/autorun'
#require 'test/unit'
require 'pry'
class NumberFactorTopDown < Minitest::Test

  def test_calc
    #assert_equal(6, ways_to_get_n(5))
    assert_equal(15, ways_to_get_n(7))
  end

  def ways_to_get_n(n)
    results = Array.new(n + 1, 0)
    ways_to_get_n_top_down(results, n)
  end

  def ways_to_get_n_top_down(results, n)
    numbers = [1, 3, 4]
    if n == 0 || n == 1 || n == 2
      return 1
    end

    if n == 3
      return 2
    end

    if results[n] == 0
      subtract1 = ways_to_get_n_top_down(results, n - 1)
      subtract3 = ways_to_get_n_top_down(results, n - 3)
      subtract4 = ways_to_get_n_top_down(results, n - 4)
      results[n] = subtract1 + subtract3 + subtract4
      binding.pry
    end
    results[n]
  end

end

# Time Complexity = O(n)
# Space Complexity = O(n)

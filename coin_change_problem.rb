require 'test/unit'
require 'pry'
class CoinChangeProblem < Test::Unit::TestCase

  def test_calc
    assert_equal([50, 20], calc(70))
    assert_equal([100, 20, 1], calc(121))
    assert_equal([1000, 1000, 20, 20, 5], calc(2045))
  end

  def calc(input)
    results = []
    remaining = input
    coins = [1, 2, 5, 10, 20, 50, 100, 500, 1000].sort.reverse

    until remaining == 0
      max_coin = coins.select { |c| c <= remaining }.max
      results << max_coin
      remaining -= max_coin
    end
    results
  end

end

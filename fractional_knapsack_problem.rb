require 'test/unit'
require 'pry'
class CoinChangeProblem < Test::Unit::TestCase

  def test_calc
    # [weight, value]
    arrays = [[20, 100], [30, 120], [10, 60]]
    assert_equal(240, calc(50, arrays))

    arrays = [[1, 3], [3, 5], [5, 8], [6, 6], [3, 1], [10, 2]]
    assert_equal(17, calc(10, arrays))
  end

  def calc(knapsuck_capacity, arrays)
    total_value = 0
    arrays_with_ratio = calculate_ratio(arrays)
    #Sort by the largest ratio
    arrays_with_ratio = arrays_with_ratio.sort_by { |array| array[2] }.reverse
    total_weight = 0
    arrays_with_ratio.each_with_index do |array, i|
      if total_weight + array[0] < knapsuck_capacity
        total_value += array[1]
        total_weight += array[0]
      else
        remaining_capacity = knapsuck_capacity - total_weight
        fraction_ratio = remaining_capacity / array[0].to_f
        fracted_value = array[1] * fraction_ratio
        total_value += fracted_value
      end
    end
    total_value.floor

  end

  def calculate_ratio(arrays)
    arrays.each do |array|
      weight = array[0]
      value = array[1]
      value_per_weight = (value / weight.to_f)
      array[2] = value_per_weight
    end
    arrays
  end

end

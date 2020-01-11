require 'test/unit'
class SecondLargest < Test::Unit::TestCase

  def test_calc
    nums = [-1, 10, 8, 9, 10, 9, -8, 11]
    assert_equal(10, calc(nums))
  end

  def calc(nums)
    first_largest = nil
    second_largest = nil
    nums.each do |n|

      if !first_largest.nil? && second_largest.nil?
        second_largest = n
      end

      if first_largest.nil?
        first_largest = n
      end

      next unless second_largest

      if n > first_largest
        first_largest = n
      elsif n > second_largest && n != first_largest
        second_largest = n
      end

      if second_largest > first_largest
        tmp_second = second_largest
        second_largest = first_largest
        first_largest = tmp_second
      end

    end
    second_largest
  end

end

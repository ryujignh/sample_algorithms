require 'test/unit'
require 'pry'
class SubtractTheProductAndSumOfDigitsOfAnInteger < Test::Unit::TestCase

  #1281. Subtract the Product and Sum of Digits of an Integer
  #https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/

  #Given an integer number n, return the difference between the product of its digits and the sum of its digits.
  def test_calc
    #Explanation:
    #Product of digits = 2 * 3 * 4 = 24
    #Sum of digits = 2 + 3 + 4 = 9
    #Result = 24 - 9 = 15

    test_cases = [
        [234, 15],
        [4421, 21],
        [705, -12]
    ].each do |test_case|
      input = test_case[0]
      output = test_case[1]
      assert_equal(output,
                   subtract_product_and_sum(input))
    end
  end

  def subtract_product_and_sum(n)
    product = 0
    sum_of_digits = 0
    n_string = n.to_s
    n_string.size.times do |i|
      n = n_string[i].to_i
      if product == 0 && i == 0
        product = n
      else
        product = n * product
      end
      sum_of_digits += n
    end
    product - sum_of_digits
  end

end

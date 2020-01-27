require 'test/unit'
require 'pry'
class FindNumbersWithEvenNumberOfDigits < Test::Unit::TestCase

  #https://leetcode.com/problems/find-numbers-with-even-number-of-digits/

  def test_calc

    nums = [12, 345, 2, 6, 7896]
    output = 2
    find_numbers(nums)

    nums = [555, 901, 482, 1771]
    output = 1
    find_numbers(nums)
  end

  def find_numbers(nums)
    count = 0
    nums.each do |num|
      if num.to_s.size % 2 == 0
        count += 1
      end
    end
    count
  end

end

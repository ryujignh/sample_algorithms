require 'test/unit'

class Takahashi < Test::Unit::TestCase
  def test_solution
    a = 2
    b = 3
    c = 3

    a, b = solution(a, b, c)
    assert_equal(0, a)
    assert_equal(2, b)

    a = 500000000000
    b = 500000000000
    a, b = solution(a, b, 1000000000000)
    assert_equal(0, a)
    assert_equal(0, b)
  end

  def solution(a, b, c)
    for i in (1..c) do
      if a == 0 && b == 0
        break
        return [a, b]
      end
      if a >= 1
        a -= 1
      else
        b -= 1
      end
    end
    [a, b]
  end

end
#a = gets.chomp.to_i
#b = gets.chomp.to_i
#c = gets.chomp.to_i

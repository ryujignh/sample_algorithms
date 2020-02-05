require 'minitest/autorun'
require 'pry'
class ReverseString < Minitest::Test

  def test_run
    input = ["h", "e", "l", "l", "o"]
    output = ["o", "l", "l", "e", "h"]

    assert_equal(output,
                 reverse_string(input))
  end

  def reverse_string(s, index = 0)
    return s if index == s.size / 2

    first_char = s[index]
    last_char = s[s.size - 1 - index]
    s[index] = last_char
    s[s.size - 1 - index] = first_char
    index += 1
    reverse_string(s, index)
    s
  end

end

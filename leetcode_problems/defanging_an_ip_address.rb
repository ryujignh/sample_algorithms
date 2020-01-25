require 'test/unit'
require 'pry'
class DefanginAnIpAddress < Test::Unit::TestCase

  # https://leetcode.com/problems/defanging-an-ip-address/
  # Qiita: https://qiita.com/ryujignh/items/51ba1a7172cc6c160c08　

  def test_defang_i_paddr
    input = "1.1.1.1"
    output = "1[.]1[.]1[.]1"
    assert_equal(output, defang_i_paddr(input))

    input = "255.100.50.0"
    output = "255[.]100[.]50[.]0"
    assert_equal(output, defang_i_paddr(input))
  end

  def defang_i_paddr(address)
    address.gsub('.', '[.]')
  end

end

require 'minitest/autorun'
require 'minitest/focus'

def product_except_self(s)
end

class TestLongestSubstring < Minitest::Test
  def test_example_1
    nums = [1, 2, 3, 4]
    output = product_except_self(nums)
    assert_equal [24, 12, 8, 6], output
  end

  def test_example_2
    nums = [-1, 1, 0, -3, -3]
    output = product_except_self(nums)
    assert_equal [0, 0, 0, 0, 0], output
  end
end


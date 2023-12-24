require 'minitest/autorun'

def two_sum(numbers, target)
  l, r = 0, numbers.length - 1

  while l < r
    sum = numbers[l] + numbers[r]
    return [l + 1, r + 1] if sum == target

    sum > target ? r -= 1 : l += 1
  end
end

class TestContainsDuplicate < Minitest::Test
  def test_two_sum_long
    output = two_sum([2, 7, 11, 15], 9)
    assert_equal [1, 2], output
  end

  def test_two_sum_short
    output = two_sum([2, 3, 4], 6)
    assert_equal [1, 3], output
  end

  def test_two_sum_minimum
    output = two_sum([-1, 0], -1)
    assert_equal [1, 2], output
  end
end


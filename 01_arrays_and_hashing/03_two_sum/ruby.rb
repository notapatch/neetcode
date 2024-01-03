require 'minitest/autorun'

# # Hash value to index
def two_sum(nums, target)
  checked = {}
  nums.each_with_index do |value, index|
    complement = target - value
    if checked.key?(complement)
      return [checked[complement], index]
    end

    checked[value] = index
  end
end

# Brute force
# def two_sum(nums, target)
#   nums.each_with_index do |value, index|
#     complement = target - value
#     complement_index = nums[index + 1..].index(complement)
#     return [index, index + complement_index + 1] if complement_index
#   end
# end

class TestContainsDuplicate < Minitest::Test
  def test_two_sum_long
    output = two_sum([2, 7, 11, 15], 9)
    assert_equal [0, 1], output
  end

  def test_two_sum_short
    output = two_sum([3, 2, 4], 6)
    assert_equal [1, 2], output
  end
end


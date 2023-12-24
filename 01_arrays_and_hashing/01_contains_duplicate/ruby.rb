require 'minitest/autorun'

# Brute force
# def contains_duplicate(nums)
#   nums.each_with_index do |num, index|
#     return true if nums[index + 1..].include?(num)
#   end
#   false
# end

# Sort and consecutive
# def contains_duplicate(arr)
#   arr.sort.each_cons(2).any? { |a, b| a == b }
# end

# Set solution
def contains_duplicate(nums)
  set = Set[]
  nums.any? { |num| !set.add?(num) }
end

class TestContainsDuplicate < Minitest::Test
  def test_contains_duplicate
    assert contains_duplicate([1, 2, 3, 1])
  end

  def test_contains_no_duplicate
    refute contains_duplicate([1, 2, 3, 4])
  end
end

require 'minitest/autorun'



def search(nums, target)
  l = 0
  r = nums.length - 1

  while l <= r
    middle = (r + l) / 2
    if target == nums[middle]
      return middle
    elsif target <= nums[middle]
      r = middle - 1
    else
      l = middle + 1
    end
  end
  -1
end


class TestContainsDuplicate < Minitest::Test
  def test_binary_match
    nums = [-1, 0, 3, 5, 9, 12]
    target = 9
    assert_equal 4, search(nums, target)
  end

  def test_contains_miss
    nums = [-1, 0, 3, 5, 9, 12]
    target = 2
    assert_equal -1, search(nums, target)
  end
end

require 'minitest/autorun'

def longest_consecutive(nums)
  num_set = Set.new(nums)
  longest_streak = 0
  num_set.each do |num|
    if !num_set.include?(num - 1)
      current_streak  = 1
      current_streak += 1 while(num_set.include?(num + current_streak))
      longest_streak = [current_streak, longest_streak].max
    end
  end
  longest_streak
end

class TestLargestConsecutiveSequence < Minitest::Test
  def test_example_1
    nums = [100,4,200,1,3,2]
    assert_equal 4, longest_consecutive(nums)
  end

  def test_example_2
    nums = [0,3,7,2,5,8,4,6,0,1]
    assert_equal 9, longest_consecutive(nums)
  end
end


require 'minitest/autorun'

def three_sum(nums)
  output = Set.new
  sorted = nums.sort
  sorted.sort.each_with_index do |num, index|
    next if !index.zero? && sorted[index - 1] == sorted[index]

    l, r = index + 1, sorted.length - 1
    while l < r
      target = sorted[index] + sorted[l] + sorted[r]
      output << [sorted[index], sorted[l], sorted[r]] if target.zero?

      target >= 0 ? r -= 1 : l += 1
    end
  end
  output.to_a
end

class TestThreeSum < Minitest::Test
  def test_three_sum_no_duplicates
    input = [-1, 0, 1, 2, -1, -4]
    output = three_sum(input)
    assert_equal  [[-1, -1, 2], [-1, 0, 1]], output
  end

  def test_no_match
    input = [0, 1, 1]
    output = three_sum(input)
    assert_equal [], output
  end

  def test_no_duplicate
    input = [0, 0, 0, 0]
    output = three_sum(input)
    assert_equal [[0, 0, 0]], output
  end
end


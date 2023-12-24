require 'minitest/autorun'

Solutions

1. Sort

a. Create a tally
b. Sort it in asc order
c. Time complexity: n log n


2. Max heap

We only want the first k results so we can use max heap

a. Create a tally on a max heap
b. Pop K times
c. Time complexity. Each pop log n. Which we do k times. So O(k.log n)
   This is better while k < n

3. Create an array of count => value

Array of values
  nums: [1, 1, 1, 2, 2, 3, 4]
Hash of value to count:
  frequency: { 1: 3, 2: 2, 3: 1, 4: 1}
Array of count to values
count_to_key: [[], [3, 4], [2], [1] ]

index: (count):  0  |  1     |  2  |  3
Values        :  -  | [3, 4] | [2] | [1]

a. Create a tally: value to count
b. Create a count_to_key: count to [value]
   (max len len of nums because count <= nums.length + 1)
c. Iterate max count to 1. Add any Return on adding k items to result

def top_k_frequent(nums, k)
  frequency = nums.tally
  count_to_key = Array.new(nums.length + 1) { [] }
  frequency.each { |key, count| count_to_key[count] << key }

  result = []
  (count_to_key.length - 1).downto(1) do |count|
    count_to_key[count].each do |value|
      result << value
      return result if result.length == k
    end
  end
end

class TestValidPalindrome < Minitest::Test
  def test_minimum
    assert [1], top_k_frequent([1], 1)
  end

  def test_K_one
    assert_equal [1], top_k_frequent([1, 1, 1, 2, 2, 3], 1)
  end

  def test_K_two
    assert_equal [1, 2], top_k_frequent([1, 1, 1, 2, 2, 3], 2)
  end
end

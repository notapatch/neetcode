require 'minitest/autorun'
require 'minitest/focus'

def length_of_longest_substring(s)
  left, right = 0, 0
  unique_chars = Set.new
  result = 0
  while right < s.length
    if unique_chars.include? s[right]
      # repeated char
      unique_chars.delete s[left]
      left += 1
    else
      # unrepeated
      unique_chars.add(s[right])
      result = [unique_chars.size, result].max
      right += 1
    end
  end
  result
end

class TestLongestSubstring < Minitest::Test
  def test_repeated
    s = "bbbbb"
    output = length_of_longest_substring(s)
    assert_equal 1, output
  end

  def test_pair
    s = "ab"
    output = length_of_longest_substring(s)
    assert_equal 2, output
  end

  def test_example1
    s = "abcabcbb"
    output = length_of_longest_substring(s)
    assert_equal 3, output
  end

  def test_example3
    s = "pwwkew"
    output = length_of_longest_substring(s)
    assert_equal 3, output
  end

  def test_exampale_407
    s = "dvdf"
    output = length_of_longest_substring(s)
    assert_equal 3, output
  end
end


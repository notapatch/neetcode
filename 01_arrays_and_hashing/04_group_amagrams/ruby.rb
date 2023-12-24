require 'minitest/autorun'

# Group by sorting them / make the keky the same
# Time: m * (n log n)  (n is average lengthy)
# n is the avg length of each input string
# m is the number of input strings

def group_anagrams(strs)
  anagrams = Hash.new { |hash, key| hash[key] = [] }

  strs.each do |anagram|
    anagrams[anagram.chars.sort.join] << anagram
  end
  anagrams.values
end

# O (m . n)
# Key of the character count and value is list of anagarms

def group_anagrams(strs)
  res = Hash.new { |hash, key| hash[key] = [] }

  strs.each do |s|
    count = Array.new(26, 0)

    s.each_char do |c|
      count[c.ord - 'a'.ord] += 1
    end

    res[count] << s
  end

  res.values
end
#
class TestValidPalindrome < Minitest::Test
  def test_minimum
    assert [['a']], group_anagrams(['a'])
  end

  def test_group_two
    assert [['tea', 'eat']], group_anagrams(['tea', 'eat'])
  end

  def test_group_two_and_one
    assert [['tea', 'eat']], group_anagrams(['bat', 'tea', 'eat'])
  end

  def test_empty_str
    assert [[""]], group_anagrams([''])
  end

  def test_smoke_test
    assert  [["bat"],["nat","tan"],["ate","eat","tea"]],
            group_anagrams(["eat","tea","tan","ate","nat","bat"])
  end
end

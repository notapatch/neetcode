require 'minitest/autorun'

#TODO: Solve anagaram by tallying letters

def anagram?(s, t)
  return false if s.length != t.length

  s.chars.sort == t.chars.sort
end

class TestContainsDuplicate < Minitest::Test
  def test_contains_anagram
    assert anagram?("anagram", "nagaram")
  end

  def test_contains_no_duplicate
    refute anagram?("rat", "cat")
  end
end



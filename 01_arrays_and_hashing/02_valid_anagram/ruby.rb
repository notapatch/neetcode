require 'minitest/autorun'

# def anagram?(s, t)
#   return false if s.length != t.length
#
#   s.chars.tally == t.chars.tally
# end

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



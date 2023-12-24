require 'minitest/autorun'

def is_palindrome(s)
  l, r = 0, s.length - 1

  while l < r
    l += 1 while l < r && !alphanumeric?(s[l])
    r -= 1 while l < r && !alphanumeric?(s[r])

    return false unless s[l].casecmp?(s[r])

    l += 1
    r -= 1
  end
  true
end

def alphanumeric?(c)
  c.match?(/[[:alnum:]]/)
end

class TestValidPalindrome < Minitest::Test
  def test_even_simple_palidrome
    assert is_palindrome('amma')
  end

  def test_odd_simple_palidrome
    assert is_palindrome('amnma')
  end

  def test_odd_simple_cased_palidrome
    assert is_palindrome('Amnma')
  end

  def test_odd_simple_spaced_palidrome
    assert is_palindrome('a mn ma')
  end

  def test_with_non_alphanumeric
    assert is_palindrome('A man, a plan, a canal: Panama')
  end

  def test_not_palindrome
    refute is_palindrome('race a car')
  end

  def test_empty_string
    assert is_palindrome(' ')
  end

  def test_non_alphanumeric_only
    assert is_palindrome('.,')
  end

  def test_short_palindrome_with_non_alpha_only
    assert is_palindrome('b_')
  end
end

# def is_palindrome(s)
#   normalized = s.gsub(/\W /, '').upcase
#   return false if normalized.empty?
#
#   normalized == normalized.reverse
# end


require 'minitest/autorun'

# @param {String} s
# @return {Boolean}
def is_valid(s)
  close_to_open = { ')' => '(', ']' => '[', '}' => '{' }
  stack = []
  s.chars.each do |brace|
    if open = close_to_open[brace]
      return false unless stack.pop == open
    else
      stack.push(brace)
    end
  end
  stack.empty?
end

class TestValidPalindrome < Minitest::Test
  def test_even_simple_partenthesise
    s = '()'
    assert is_valid(s)
  end

  def test_even_simple_brace
    s = '{}'
    assert is_valid(s)
  end

  def test_single_brace
    s = '{'
    refute is_valid(s)
  end

  def test_double_open_brace
    s = '{{'
    refute is_valid(s)
  end

  def test_wrong_close
    s = '(]'
    refute is_valid(s)
  end

  def test_double_brace
    s = '(())'
    assert is_valid(s)
  end

  def test_diff_double_brace
    s = '([])'
    assert is_valid(s)
  end

  def test_all_braces
    s = "()[]{}"
    assert is_valid(s)
  end
end

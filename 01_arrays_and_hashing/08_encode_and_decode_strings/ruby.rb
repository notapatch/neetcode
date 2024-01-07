require 'minitest/autorun'
require 'minitest/focus'

def encode(strs)
  strs.map {|str| "#{str.length}##{str}"}.join
end

def decode(str)
  res = []
  i = 0
  while i < str.length
    j = i
    j += 1 while str[j] != "#"
    len = str[i...j].to_i
    res << str[j + 1, len]
    i = j + 1 + len
  end
  res
end

class TestLongestSubstring < Minitest::Test
  def test_encode
    input = ["lint", "code", "love", "you"]
    encode_output = encode(input)
    assert_equal "4#lint4#code4#love3#you", encode_output
  end

  def test_decode
    input = "4#lint3#you"
    decode_output = decode(input)
    assert_equal ["lint", "you"], decode_output
  end
  focus def test_example_1
    input = ["lint", "code", "love", "you"]
    encode_output = encode(input)
    decode_output = decode(encode_output)
    assert_equal ["lint","code","love","you"], decode_output
  end
end


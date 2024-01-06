require 'minitest/autorun'

def max_profit(prices)
  l, r = 0, 1
  max_p = 0

  while r < prices.length
    if prices[l] < prices[r]
      profit = prices[r] - prices[l]
      max_p = [profit, max_p].max
    else
      l = r
    end
    r += 1
  end
  max_p
end

class TestBestTimeToBuy < Minitest::Test
  def test_max_profit_simple
    prices = [7, 1, 5, 3, 6, 4]
    output = max_profit(prices)
    assert_equal 5, output
  end

  def test_descending
    prices = [7, 6, 4, 3, 1]
    output = max_profit(prices)
    assert_equal 0, output
  end

  def test_no_profit
    prices = [3, 2, 6, 5, 0, 3]
    output = max_profit(prices)
    assert_equal 4, output
  end

  def test_profit_change_last
    prices = [6, 1, 3, 2, 4, 7]
    output = max_profit(prices)
    assert_equal 6, output
  end

  def test_base_case
    prices = [1, 2]
    output = max_profit(prices)
    assert_equal 1, output
  end

  def test_one_item
    prices = [1]
    output = max_profit(prices)
    assert_equal 0, output
  end
end


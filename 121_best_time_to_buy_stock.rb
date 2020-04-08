# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  purch = prices.max
  res = 0

  prices.each.with_index do |price, idx|
    if  price < purch
      purch = price
    elsif price - purch > res
      res = price - purch
    end
  end
  res
end

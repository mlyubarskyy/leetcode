# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    res = 0
    prices.each.with_index do |el, i|
        next if i == 0
        gain = el - prices[i-1]
        res += gain if gain > 0
    end
    res
end

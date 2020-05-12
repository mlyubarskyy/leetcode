# Time complexity : O(n)

# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
  dp = Array.new(a.size) { 0 }
  sum = 0
  (2...a.size).each do |i|
    if a[i] - a[i-1] == a[i-1] - a[i-2]
      dp[i] = 1 + dp[i - 1]
      sum+=dp[i]
    end
  end
  sum
end

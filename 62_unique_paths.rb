# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  return 1 if m == 1 || n == 1

  unique_paths(m-1, n) + unique_paths(m, n-1)
end

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
#     1 1 1
#    -------
# 1 | 2 3 4
# 1 | 3 6 10
  dp = Array.new(m) { [1] * n }

  for i in 1...m
    for j in 1...n
      dp[i][j] = dp[i-1][j] + dp[i][j-1]
    end
  end
  puts dp[m-1].inspect
  dp[m-1][n-1]
end

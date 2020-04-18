# @param {String} s
# @return {Boolean}
def check_valid_string(s)
  return true if s.empty?

  n = s.size
  dp = Array.new(n) { Array.new(n) { false } }

  lefty, righty = '(*', ')*'

  n.times do |i|
    dp[i][i] = true if s[i] == '*'
    if i < n - 1 && lefty.include?(s[i]) && righty.include?(s[i+1])
      dp[i][i+1] = true
    end
  end

  (2...n).each do |size|
    (n-size).times do |i|
      if s[i] == '*' && dp[i+1][i+size]
        dp[i][i+size] = true
      elsif lefty.include?(s[i])
        ((i+1)...(i+size+1)).each do |k|
          if righty.include?(s[k]) && (k == i+1 || dp[i+1][k-1]) && (k == i+size || dp[k+1][i+size])
            dp[i][i+size] = true
          end
        end
      end
    end
  end

  dp[0][-1]
end

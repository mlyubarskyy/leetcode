def max_uncrossed_lines(a, b)
  m, n = a.size, b.size
  d = Array.new(m+1) { Array.new(n+1, 0) }

  (m-1).downto(0).each do |i|
    (n-1).downto(0).each do |j|
      if a[i] == b[j]
        d[i][j] = d[i+1][j+1] + 1
      else
        d[i][j] = [d[i][j+1], d[i+1][j]].max
      end
    end
  end

  d[0][0]
end

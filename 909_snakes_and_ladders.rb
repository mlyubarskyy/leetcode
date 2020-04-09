# @param {Integer[][]} board
# @return {Integer}
def snakes_and_ladders(board)
  n = board.size
  dist = {1 => 0}
  q = [1]
  while q.any?
    s = q.shift
    return dist[s] if s == n*n

    (s+1..[s+6, n*n].min).each do |s2|
      r,c = get(s2, n)
      s2 = board[r][c] if board[r][c] != -1
      if !dist.has_key?(s2)
        dist[s2] = dist[s] + 1
        q << s2
      end
    end
  end
  -1
end

def get(s, n)
  quot, rem = (s-1).divmod n
  row = n - 1 - quot
  col = if row%2 != n%2
    rem
  else
    n - 1 -rem
  end
  [row,col]
end

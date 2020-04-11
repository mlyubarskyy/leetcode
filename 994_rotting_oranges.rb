# @param {Integer[][]} grid
# @return {Integer}

# Time Complexity: O(N), where N is the number of cells in the grid.
# Space Complexity: O(N).

def oranges_rotting(grid)
  directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]
  h, w = grid.size-1, grid[0].size-1

  q = []
  (0..h).each do |x|
    (0..w).each do |y|
      q << [x, y, 0] if grid[x][y] == 2
    end
  end

  t = 0
  while !q.empty?
    x, y, t = q.shift
    directions.each do |l,r|
      if (x+l).between?(0, h) && (y+r).between?(0, w) && grid[x+l][y+r] == 1
        q << [x+l, y+r, t+1]
        grid[x+l][y+r] = 2
      end
    end
  end

  for row in grid
    return -1 if row.include?(1)
  end
  t
end

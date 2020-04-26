# @param {Integer[][]} grid
# @return {Integer}

DIRECTIONS = [ [-1, 0],[0, -1],[1,0],[0,1]]

def island_perimeter(grid)
  s = []
  ans = 0

  for i in (0...grid.size)
    for j in (0...grid[0].size)
      if grid[i][j] == 1
        s << [i, j]
        break
      end
    end
  end

  while s.any?
    x, y = s.shift
    # puts [:arrived_to, x, y, grid[x][y]].inspect
    next if grid[x][y] == '*'
    grid[x][y] = '*'
    t = 0
    DIRECTIONS.each do |shift_x,shift_y|
      # puts [:checking, x+shift_x, y+shift_y].inspect

      if (x+shift_x).between?(0, grid.size-1) && (y+shift_y).between?(0, grid[0].size-1)
        if grid[x+shift_x][y+shift_y] == 0
          t += 1
        elsif grid[x+shift_x][y+shift_y] == 1
          s << [x+shift_x, y+shift_y]
        end
      else
        t += 1
      end
    end
    # puts [:found, t, :sides_at, x, y, grid[x][y]].inspect
    ans += t
  end

  # puts ans
  ans
end

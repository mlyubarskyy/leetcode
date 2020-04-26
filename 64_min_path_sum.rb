# @param {Integer[][]} grid
# @return {Integer}
DIRECTIONS = [[-1,0],[0,-1],[1,0],[0,1]].freeze

def min_path_sum(grid)
  h, w = grid.size-1, grid[0].size-1

  (0..h).reverse_each do |i|
    (0..w).reverse_each do |j|
      if h == i && w != j
        grid[i][j] = grid[i][j] + grid[i][j + 1]
      elsif w == j && h != i
        grid[i][j] = grid[i][j] + grid[i+1][j]
      elsif w != j && h != i
        grid[i][j] = grid[i][j] + [grid[i+1][j], grid[i][j+1]].min
      end
    end
  end

  grid[0][0]
end

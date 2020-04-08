# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
DIRECTIONS = [ [-1,0], [0,-1], [1,0], [0,1] ].freeze

def flood_fill(image, sr, sc, new_color)
  color = image[sr][sc]
  return image if color == new_color

  dfs(image, sr, sc, new_color, color)
  image
end

def dfs(image, sr, sc, new_color, color)
  if image[sr][sc] == color
    image[sr][sc] = new_color

    DIRECTIONS.each do |i,j|
      next if !(0...image.size).include?(sr+i)
      next if !(0...image[0].size).include?(sc+j)

      dfs(image, sr+i, sc+j, new_color, color)
    end
  end
end

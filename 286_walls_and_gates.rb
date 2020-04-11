# @param {Integer[][]} rooms
# @return {Void} Do not return anything, modify rooms in-place instead.

DIRECTIONS = [ [-1,0], [0,-1], [1,0], [0,1] ].freeze

def walls_and_gates(rooms)
  (0...rooms.size).each do |x|
    (0...rooms[0].size).each do |y|
      dfs(rooms, x, y, 0) if rooms[x][y] == 0
    end
  end

  rooms
end

def dfs rooms, x, y, dist
  rooms[x][y] = dist if rooms[x][y] != 0

  DIRECTIONS.each do |i, j|
    next if (x+i) < 0 || (x+i) >= rooms.size
    next if (y+j) < 0 || (y+j) >= rooms[0].size
    next if rooms[x+i][y+j] <= dist + 1

    dfs(rooms, x+i, y+j, dist + 1)
  end

  dist -= 1
end

# @param {Integer[][]} rooms
# @return {Void} Do not return anything, modify rooms in-place instead.

DIRECTIONS = [ [-1,0], [0,-1], [1,0], [0,1] ].freeze

def walls_and_gates(rooms)
  s = []

  (0...rooms.size).each do |x|
    (0...rooms[0].size).each do |y|
      s << [x, y, 0] if rooms[x][y] == 0
    end
  end

  while s.size > 0
    x, y, dist = s.shift
    rooms[x][y] = dist if rooms[x][y] > dist

    DIRECTIONS.each do |i, j|
      next if (x+i) < 0 || (x+i) >= rooms.size
      next if (y+j) < 0 || (y+j) >= rooms[0].size

      s << [x+i, y+j, dist + 1] if rooms[x+i][y+j] == 2147483647
    end
  end

  rooms
end

# @param {Integer[]} stones
# @return {Integer}
#
# Time complexity : O(N^2)

def last_stone_weight(stones)
  stones.sort!

  while stones.size > 1
    x = stones.pop
    y = stones.pop

    next if x == y
    clashed = (x-y).abs
    i = 0
    while stones[i] && stones[i] < clashed
      i+=1
    end
    stones.insert(i, clashed)
  end

  stones.first || 0
end

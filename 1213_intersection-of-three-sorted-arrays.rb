# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer[]} arr3
# @return {Integer[]}
def arrays_intersection(arr1, arr2, arr3)
  map = {}
  res = []

  [arr1, arr2, arr3].each do |arr|
    arr.each do |i|
      map[i] = (map[i] || 0) + 1
      res << i if map[i] == 3
    end
  end

  res
end

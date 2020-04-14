# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  map = {}
  (0...nums1.size).each do |i|
    map[nums1[i]] ||= 0
    map[nums1[i]] += 1
  end

  res = []
  nums2.each do |el|
    if map[el] && map[el] > 0
      res << el
      map[el] -= 1
    end
  end
  res
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  count = 0
  sum = 0

  map = {0 => 1}
  (0...nums.length).each do |i|
    sum += nums[i]
    count += map[sum - k] if map.has_key?(sum - k)
    map[sum] = (map[sum] || 0) + 1
  end

  count
end

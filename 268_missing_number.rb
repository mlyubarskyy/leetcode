# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  bit = nums.size
  nums.each.with_index { |n, i| bit ^= i ^ n }
  bit
end

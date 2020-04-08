# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
  arr = nums.sort
  (1...nums.size).step(2).each {|i| nums[i] = arr.pop }
  (0...nums.size).step(2).each {|i| nums[i] = arr.pop }
end

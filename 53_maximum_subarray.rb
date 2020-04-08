# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  ans = nums[0]
  nums.inject(0) do |sum, i|
    sum += i
    ans = [sum, ans].max
    sum = [sum, 0].max
    sum
  end
  ans
end

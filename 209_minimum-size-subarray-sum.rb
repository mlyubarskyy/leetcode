# Time complexity: O(n). Single iteration of O(n).
# Each element can be visited atmost twice,
# once by the right pointer(ii) and (atmost)once by the left pointer.
# Space complexity: O(1) extra space.
# Only constant space required for left, sum, ans and ii.

# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  n = nums.size
  ans = 9999
  left = 0
  sum = 0

  (0...n).each do |i|
    sum += nums[i]
    while sum >= s
      ans = [ans, i+1-left].min
      sum -= nums[left]
      left+=1
    end
  end

  ans != 9999 ? ans : 0
end

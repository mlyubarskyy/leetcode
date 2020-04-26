# @param {Integer[]} nums
# @return {Boolean}

# Time complexity : O(2^n).
# There are 2^n (upper bound) ways of jumping
#   from the first position to the last,
#   where nn is the length of array nums.
# For a complete proof, please refer to Appendix A.

# Space complexity : O(n).
# Recursion requires additional memory for the stack frames.

def can_jump_backtracking(nums, position=0)
  return true if position == nums.length - 1

  furthest_jump = [position + nums[position], nums.length - 1].min
  (position+1..furthest_jump).each do |next_position|
    return true if can_jump_backtracking(nums, next_position)
  end

  false
end

# Complexity O(n)
# Capacity O(1)
def can_jump_greedy(nums)
  last_pos = nums.size - 1
  (0..nums.size-1).reverse_each do |i|
    last_pos = i if i + nums[i] >= last_pos
  end
  last_pos == 0
end

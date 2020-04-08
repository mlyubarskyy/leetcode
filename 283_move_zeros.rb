# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    idx = nums.size - 1
    while idx >= 0
        if nums[idx] == 0
            nums.delete_at(idx)
            nums << 0
        end
        idx -=1
    end

    nums
end


# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  slow = 0
  fast = 0

  while slow < nums.size
    fast += 1 while nums[fast]&.zero?

    nums[slow] = nums[fast] || 0 unless slow == fast

    slow += 1
    fast += 1
  end

  nums
end

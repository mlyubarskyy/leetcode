# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return if nums == []
  i = nums.size - 1
  while i != 0
    if nums[i-1] && nums[i] == nums[i-1]
      nums.delete_at(i-1)
    else
      i -= 1
    end
  end
  nil
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

def missing_element(nums, k)
  missing = -> (idx) { nums[idx] - nums[0] - idx }
  n = nums.size

  return nums[-1] + k - missing.call(n - 1) if k > missing.call(n - 1)

  idx = 1
  while missing.call(idx) < k
    idx+=1
  end

  nums[idx-1] + k - missing.call(idx-1 )
end


# Time Limit Exceeded
def missing_element(nums, k)
  missing_index = 0
  cur = nums.shift

  while missing_index < k
    return cur + k - missing_index if !nums[0]

    if nums[0] - cur > 1

      cur += 1
      missing_index += 1
      return cur if missing_index == k
    else
      cur = nums.shift
    end
  end
end

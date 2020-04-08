# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  pivot = nil
  res = nil
  nums.size.times do |i|
    pivot = i if nums[i+1] && nums[i+1] < nums[i]
  end

  if pivot
    res = binary_search(nums[0..pivot], target) || binary_search(nums[pivot+1..nums.size], target, pivot+1)
  elsif
    res = binary_search(nums, target)
  end
  res || -1
end

def binary_search(arr, value, shift=0)
  floor = 0
  ceiling = arr.length - 1
  while floor <= ceiling
    guess = (floor + ceiling)/ 2
    if arr[guess] == value
      return guess + shift
    elsif arr[guess] < value
      floor = guess + 1
    else
      ceiling = guess - 1
    end
  end

  nil
end

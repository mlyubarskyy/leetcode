def three_sum(nums)
  res = []
  nums.sort!
  return [] if nums.size < 3
  return [[0,0,0]] if nums.uniq == [0]

  for i in 0..(nums.size - 2)
    h = {}
    for j in (i + 1)..(nums.size - 1)
      if h[-(nums[i] + nums[j])]
        s = [nums[i], nums[j], -(nums[i] + nums[j])]
        res << s if res[-1] != s
      else
        h[nums[j]] = j
      end
    end
  end
  res.to_a
end

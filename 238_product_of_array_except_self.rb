# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  len = nums.size
  l = Array.new(len)
  r = Array.new(len)

  (0...len).each do |i|
    if i == 0
      l[0] = 1
      r[~0] = 1
    else
      l[i] = nums[i-1] * l[i-1]
      r[~i] = nums[~i+1] * r[~i+1]
    end
  end

  (0...nums.size).map {|i| l[i] * r[i] }
end

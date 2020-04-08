# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  seen_once = seen_twice = 0

  nums.each do |num|
    seen_once = ~seen_twice & (seen_once ^ num)
    seen_twice = ~seen_once & (seen_twice ^ num)
  end

  seen_once
end

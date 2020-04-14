# @param {Integer[]} nums
# @return {Integer}
def find_max_length(nums)
  map = {0 => -1}
  max_len, count = 0, 0

  (0...nums.size).each do |i|
    count = count + (nums[i] == 1 ? 1 : -1)
    if map[count]
      max_len = [max_len, i - map[count]].max
    else
      map[count] = i
    end
  end

  max_len
end

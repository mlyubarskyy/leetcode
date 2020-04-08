# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  bit = 0
  nums.each do |num|
    bit = bit ^ num
  end

  bit
end 

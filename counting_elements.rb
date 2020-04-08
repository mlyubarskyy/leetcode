# @param {Integer[]} arr
# @return {Integer}
def count_elements(arr)
  hsh = arr.zip(Array.new(arr.size) {1}).to_h
  res = 0
  arr.each do |num|
    res += hsh[num+1].to_i
  end
  res
end

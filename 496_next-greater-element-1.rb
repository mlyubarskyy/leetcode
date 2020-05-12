# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
  hsh = {}

  (0...nums2.size).each do |i|
    hsh[nums2[i]] ||= -1
    (i+1...nums2.size).each do |j|
      if nums2[j] > nums2[i]
        hsh[nums2[i]] =nums2[j]
        break
      end
    end
  end

  nums1.map{|i| hsh[i] || -1}
end

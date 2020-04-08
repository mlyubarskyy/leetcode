# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  return if nums.size == 0

  mid = nums.length / 2

  node = TreeNode.new(nums[mid])
  node.left = sorted_array_to_bst(nums[0...mid])
  node.right = sorted_array_to_bst(nums[mid+1..-1])

  node
end

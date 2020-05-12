# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer[]} arr
# @return {Boolean}
def is_valid_sequence(root, arr, index=0)
  return false if !root || index == arr.size
  return true if !root.left && !root.right && root.val == arr[index] && index == arr.size-1

  root.val == arr[index] && (
    is_valid_sequence(root.left, arr, index+1) ||
    is_valid_sequence(root.right, arr, index+1)
  )
end

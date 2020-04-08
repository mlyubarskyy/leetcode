# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}
def has_path_sum(root, sum, curr_sum=0)
  return false if !root
  return true if (curr_sum += root.val) == sum && !root.left && !root.right

  has_path_sum(root.left, sum, curr_sum) || has_path_sum(root.right, sum, curr_sum)
end

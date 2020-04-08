# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def sum_numbers(node, sum=0)
  return 0 if !node
  sum = node.val + sum * 10
  return sum if !node.left && !node.right
  sum_numbers(node.left, sum) + sum_numbers(node.right, sum)
end

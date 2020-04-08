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
# @return {Integer}
def path_sum(root, sum, prev_sum=0, rec={0 => 1})
  return 0 if !root

  count = 0
  curr_sum = prev_sum + root.val

  count += rec[curr_sum - sum] if rec[curr_sum - sum]
  rec[curr_sum] = rec[curr_sum] ? rec[curr_sum] += 1 : 1

  count += path_sum(root.left,  sum, curr_sum, rec)
  count += path_sum(root.right, sum, curr_sum, rec)

  rec[curr_sum] -= 1
  count
end

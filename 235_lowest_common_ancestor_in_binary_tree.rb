# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  parent_val = root.val
  pv = p.val
  qv = q.val

  if pv > parent_val && qv > parent_val
    lowest_common_ancestor(root.right, p, q)
  elsif pv < parent_val && qv < parent_val
    lowest_common_ancestor(root.left, p, q)
  else
    root
  end
end

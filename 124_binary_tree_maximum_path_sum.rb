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

def max_path_sum(root)
  @global_max = -1000
  helper(root)
  @global_max
end

def helper root
  return 0 if !root
  left = helper(root.left)
  right = helper(root.right)

  local_max = [ root.val, root.val + left, root.val + right ].max
  @global_max = [@global_max, local_max, root.val + left + right ].max
  local_max
end

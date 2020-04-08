# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def subtree_with_all_deepest(root)
  max = max_depth(root, 0)
  answer root, 0, max
end

def answer(node, curr_depth, max_depth)
  return node if !node || curr_depth == max_depth

  l = answer(node.left, curr_depth + 1, max_depth)
  r = answer(node.right, curr_depth + 1, max_depth)

  l && r ? node : l || r
end

def max_depth(node, depth)
  return 0 if !node
  [ max_depth(node.left, depth+1), max_depth(node.right, depth+1), depth ].max
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

ALPHA = "abcdefghijklmnopqrstuvwxyz".freeze

# @param {TreeNode} root
# @return {String}
def smallest_from_leaf(root)
  out = []
  preorder root, [], out
  out.min
end

def preorder node, path, paths
  return if !node

  path.unshift ALPHA[node.val]
  if !node.left && !node.right
    paths << path.join
  else
    preorder node.left, path, paths
    preorder node.right, path, paths
  end

  path.shift
end

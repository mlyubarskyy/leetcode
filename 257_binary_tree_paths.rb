# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root, path=[], paths=[])
  return [] if !root

  path << root.val
  if !root.left && !root.right
    paths << path.join('->')
  else
    binary_tree_paths(root.left, path, paths)
    binary_tree_paths(root.right, path, paths)
  end
  path.pop

  paths
end

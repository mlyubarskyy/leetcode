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
def sum_root_to_leaf(root)
  paths=[]
  dfs(root, '', paths)
  puts paths.inspect
  paths.sum{|n| n.to_i(2)}
end

def dfs(root, path, paths)
  return if !root

  path << root.val.to_s

  if !root.left && !root.right
    paths << path.dup
  else
    dfs(root.left, path, paths)
    dfs(root.right, path, paths)
  end

  path[-1] = ''
end

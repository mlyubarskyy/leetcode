# Definition for a binary tree root.
# class Treeroot
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Treeroot} root
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum)
  paths = []
  dfs root, sum, [], paths
  paths
end

def dfs(root, rem, path, paths)
  return unless root

  path << root.val

  if rem == root.val && !root.left && !root.right
    paths << path.dup
  else
    dfs root.left, rem - root.val, path, paths
    dfs root.right, rem - root.val, path, paths
  end

  path.pop
end

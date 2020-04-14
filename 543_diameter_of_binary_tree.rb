# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
#
# @param {TreeNode} root
# @return {Integer}
#
# Algorithm
#
# Let's calculate the depth of a node in the usual way: 
# max(depth of node.left, depth of node.right) + 1.
# While we do, a path "through" this node uses 1 + (depth of node.left) + (depth of node.right) nodes.
# Let's search each node and remember the highest number of nodes used in some path.
# The desired length is 1 minus this number.
#
def diameter_of_binary_tree(root)
  return 0 if !root

  depth(root, res = [])
  res.last - 1
end

def depth node, res
  return 0 if !node
  l, r = depth(node.left, res), depth(node.right, res)
  res << [res.last.to_i, l+r+1].max
  1 + [l,r].max
end

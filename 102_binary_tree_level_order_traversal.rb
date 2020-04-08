# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  stack = [ [root, 0] ]
  out = []

  while stack.size > 0
    node, lvl = stack.shift
    next if !node

    out[lvl] ||= []
    out[lvl] << node.val

    stack << [node.left, lvl+1] if node.left
    stack << [node.right, lvl+1] if node.right
  end

  out
end

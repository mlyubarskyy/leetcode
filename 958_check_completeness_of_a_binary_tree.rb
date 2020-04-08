# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_complete_tree(root)
  stack = [ [root, 1] ]
  last = 0

  while stack.size > 0
    node, v = stack.shift
    return false if v - last > 1
    last = v

    stack << [node.left, 2 * v] if node.left
    stack << [node.right, 2 * v + 1] if node.right
  end

  true
end

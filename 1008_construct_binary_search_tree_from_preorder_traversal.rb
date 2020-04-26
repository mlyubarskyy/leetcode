# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @return {TreeNode}
def bst_from_preorder(preorder)
  n = preorder.size
  return if n == 0

  root = TreeNode.new(preorder[0])
  stack = [root]

  (1...n).each do |i|
    node, child = stack[-1], TreeNode.new(preorder[i])
    while stack.any? && stack[-1].val < child.val
      node = stack.pop
    end

    if node.val < child.val
      node.right = child
    else
      node.left = child
    end

    stack << child
  end

  root
end

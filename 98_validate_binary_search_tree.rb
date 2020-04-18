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
def is_valid_bst(root)
  inorder root, values = []
  values.each_cons(2).all? { |a, b| (a <=> b) < 0 }
end

def inorder root, values
  return if !root
  inorder root.left, values
  values << root.val
  inorder root.right, values
end

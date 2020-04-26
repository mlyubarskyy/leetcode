# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  return [] if !root

  s = [root]
  res = []

  while s.any?
    right_most_val = s.last.val
    res << right_most_val if right_most_val
    t = []

    s.each do |node|
      t << node.left if node.left
      t << node.right if node.right
    end
    s = t
  end

  res
end

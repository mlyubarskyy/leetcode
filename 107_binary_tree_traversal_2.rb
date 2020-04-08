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
def level_order_bottom(root)
  return [] if !root
  out = []
  stack = [[root, 0]]

  while stack.size > 0
    tmp = []
    out.unshift stack.map{|n| n.first&.val}
    stack.each do |node, lvl|
      next if !node

      tmp << [node.left, lvl+1] if node.left
      tmp << [node.right, lvl+1] if node.right
    end
    stack = tmp
  end

  out
end

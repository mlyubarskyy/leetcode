# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Float[]}
def average_of_levels(root)
  return [0] if !root
  out = []
  stack = [root]

  while stack.size > 0
    tmp = []

    sum = 0.0
    stack.map{|n| sum += n.val}
    out << (sum / stack.size)

    stack.each do |node|
      next if !node

      tmp << node.left if node.left
      tmp << node.right if node.right
    end
    stack = tmp
  end
  out
end

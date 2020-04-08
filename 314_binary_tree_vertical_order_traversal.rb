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
def vertical_order(root)
  return [] if !root
  m = {0 => []}
  out = []
  stack = [ [root, 0] ]

  while stack.size > 0
    node, lvl = stack.shift

    m[lvl] ||= []
    m[lvl] << node.val

    stack << [node.left, lvl - 1] if node.left
    stack << [node.right, lvl + 1] if node.right
  end

  m.each do |lvl, arr|
    if lvl > 0
      out << arr
    else
      out.unshift arr
    end
  end
  out
end

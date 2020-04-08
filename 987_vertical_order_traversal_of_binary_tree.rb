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
def vertical_traversal(root)
  coordinates = {}
  stack = [ [root, 0, 0] ]

  while stack.size > 0
    node, lvl, d = stack.shift
    coordinates[lvl] ||= []
    coordinates[lvl] << {val: node.val, depth: d}

    stack << [node.left,  lvl - 1, d + 1] if node.left
    stack << [node.right, lvl + 1, d + 1] if node.right
  end

  res = []
  coordinates.each do |k, arr|
    sorted = arr.sort do |a,b|
      a[:depth] == b[:depth] ? a[:val] <=> b[:val] : a[:depth] <=> b[:depth]
    end

    if k > 0
      res << sorted.map{|h| h[:val]}
    else
      res.unshift(sorted.map{|h| h[:val]})
    end
  end

  res
end

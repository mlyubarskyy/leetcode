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
def is_symmetric(root)
  s = [root]

  while s.any?
    q = []
    arr = []

    s.each do |node|
      q << node&.left || nil
      q << node&.right || nil
      arr << node&.val
    end

    return false if !symmetric(arr)
    s = q
  end
  true
end

def symmetric arr
  arr == arr.reverse
end

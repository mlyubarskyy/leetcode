# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  dfs root, nums = []
  tup = nums.map{|n| [(target - n).abs, n]}.min

  tup.last
end

def dfs node, nums
  return if !node
  dfs node.left, nums
  nums << node.val.dup
  dfs node.right, nums
end


# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  closest = root.val
  while root
    closest = [root.val, closest].map{|x| [(target-x).abs, x]}.min.last
    if target < root.val
      root = root.left
    else
      root = root.right
    end
  end
  closest
end

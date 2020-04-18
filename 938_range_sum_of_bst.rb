# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}
def range_sum_bst(root, l, r)
    res = 0
    q = [root]

    while !q.empty? do
        el = q.shift
        next unless el&.val

        if el.val < l
            q << el.right
        elsif el.val > r
            q << el.left
        else
            res += el.val
            q << el.left
            q << el.right
        end
    end
    res
end

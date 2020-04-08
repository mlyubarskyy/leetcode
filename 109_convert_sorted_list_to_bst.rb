# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  return if !head
  return TreeNode.new(head.val) if !head.next

  slow, fast = head, head.next.next
  while fast and fast.next
    fast = fast.next.next
    slow = slow.next
  end

  tmp = slow.next
  slow.next = nil

  root = TreeNode.new(tmp.val)
  root.left  = sorted_list_to_bst(head)
  root.right = sorted_list_to_bst(tmp.next)
  root
end

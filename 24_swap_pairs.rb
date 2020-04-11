# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return head if !head || !head.next

  slow, fast = head, head.next
  slow.next = swap_pairs(fast.next)
  fast.next = slow

  return fast
end

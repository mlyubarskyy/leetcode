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
def reverse_list(head)
  return head if !head || !head.next
  node = reverse_list(head.next)
  head.next.next = head
  head.next = nil

  node
end

def reverse_list(head)
  prev = nil
  node = head

  while node
    tmp = node.next
    node.next = prev
    prev = node
    node = tmp
  end

  prev
end

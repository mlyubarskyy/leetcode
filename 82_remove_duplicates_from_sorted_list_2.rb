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
def delete_duplicates(head)
  return nil if !head

  if head.next && head.val == head.next.val
    while head.next && head.val == head.next.val
      head = head.next
    end
    return delete_duplicates(head.next)
  else
    head.next = delete_duplicates(head.next)
  end
  head
end

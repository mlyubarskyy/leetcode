# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  return head if !head

  node = head
  s = []
  while node = node.next
    s << ListNode.new(node.val)
  end

  node = head
  i = 1
  while s.any?
    node.next = i%2 ==0 ? s.shift : s.pop
    node = node.next
    i+=1
  end
  head.next
end

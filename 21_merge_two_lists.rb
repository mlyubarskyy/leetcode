# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
    first = curr = ListNode.new(999)

    while(l1 || l2) do
      if l1 && !l2
        curr.next = l1
        l1 = l1.next
        curr = curr.next
      elsif !l1 && l2
        curr.next = l2
        l2 = l2.next
        curr = curr.next
      else
        if l1.val <= l2.val
          temp = l1
          l1 = l1.next
        else
          temp = l2
          l2 = l2.next
        end
        curr.next = temp
        curr = curr.next
      end
    end
    first.next
end

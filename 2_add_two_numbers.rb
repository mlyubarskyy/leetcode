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
def add_two_numbers(l1, l2)
  carryover = 0
  res = []
  while l1 || l2
    if l1 && l2
      a, b = l1.val, l2.val
      l1 = l1.next
      l2 = l2.next
    elsif l1
      a, b = l1.val, 0
      l1 = l1.next
    else
      a, b = 0, l2.val
      l2 = l2.next
    end

    carryover, digit = (a + b + carryover).divmod(10)
    res << digit
  end
  res << 1 if carryover > 0

  res
end

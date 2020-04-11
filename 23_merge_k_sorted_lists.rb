# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}

# Time complexity : O(N log k) where `k` is the number of linked lists
# Space complexity : O(1)

def merge_k_lists(lists)
  len = lists.size
  if len == 0
    return []
  elsif len == 1
    return lists.first
  elsif len == 2
    return merge_lists(lists[0], lists[1]).next
  end

  l_list = merge_k_lists lists[0..len/2]
  r_list = merge_k_lists lists[len/2+1..-1]

  merge_k_lists [l_list, r_list]
end

def merge_lists(l, r, root=nil)
  root ||= ListNode.new('*')
  node = root
  while l || r
    if l && r
      if l.val == r.val
        node = node.next = ListNode.new(r.val)
        r = r.next

        node = node.next = ListNode.new(l.val)
        l = l.next
      elsif l.val < r.val
        node = node.next = ListNode.new(l.val)
        l = l.next
      else
        node = node.next = ListNode.new(r.val)
        r = r.next
      end
    elsif !l
      node = node.next = ListNode.new(r.val)
      r = r.next
    else
      node = node.next = ListNode.new(l.val)
      l = l.next
    end
  end
  root
end

# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def map
  @map ||= {}
end

def copyRandomList(head)
  return unless head
  return map[head] if map[head]

  node = Node.new(head.val)
  map[head] = node
  node.next = copyRandomList(head.next)
  node.random = copyRandomList(head.random)

  node
end

class MinStack

=begin
    initialize your data structure here.
=end
    def initialize()
        @stack = []
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
      if @stack[-1]
        min = @stack[-1][1]
        min = x if x < min
      else
        min = x
      end
      @stack << [x, min]
    end


=begin
    :rtype: Void
=end
    def pop()
      el = @stack.pop
      el[1] if el
    end


=begin
    :rtype: Integer
=end
    def top()
      el = @stack[-1]
      el[0] if el
    end


=begin
    :rtype: Integer
=end
    def get_min()
      el = @stack[-1]
      el[1] if el
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

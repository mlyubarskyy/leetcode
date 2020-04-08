class PhoneDirectory

=begin
    Initialize your data structure here
        @param maxNumbers - The maximum numbers that can be stored in the phone directory.
    :type max_numbers: Integer
=end
    def initialize(max_numbers)
      @available = Array.new(max_numbers) {|i| i }
      @allocation = {}
    end


=begin
    Provide a number which is not assigned to anyone.
        @return - Return an available number. Return -1 if none is available.
    :rtype: Integer
=end
    def get()
      return -1 if @available == []
      num = @available.shift
      @allocation[num] = 1
      num
    end


=begin
    Check if a number is available or not.
    :type number: Integer
    :rtype: Boolean
=end
    def check(number)
      !@allocation.has_key? number
    end


=begin
    Recycle or release a number.
    :type number: Integer
    :rtype: Void
=end
    def release(number)
      if @allocation.has_key? number
        @allocation.delete number
        @available.unshift number
      end
      nil
    end


end

# Your PhoneDirectory object will be instantiated and called as such:
# obj = PhoneDirectory.new(max_numbers)
# param_1 = obj.get()
# param_2 = obj.check(number)
# obj.release(number)

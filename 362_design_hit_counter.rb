class HitCounter
=begin
    Initialize your data structure here.
=end
    def initialize()
      @q = [[0, 0]] * 300
    end


=begin
    Record a hit.
        @param timestamp - The current timestamp (in seconds granularity).
    :type timestamp: Integer
    :rtype: Void
=end
    def hit(timestamp)
      idx = timestamp % 300
      time, hits = @q[idx]

      @q[idx] =  if time != timestamp
        [timestamp, 1]
      else
        [time, hits + 1]
      end
    end


=begin
    Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity).
    :type timestamp: Integer
    :rtype: Integer
=end
    def get_hits(timestamp)
      ans = 0
      300.times do |i|
          time, hit = @q[i]
          ans += hit if timestamp - time < 300
      end
      ans
    end
end

# Your HitCounter object will be instantiated and called as such:
# obj = HitCounter.new()
# obj.hit(timestamp)
# param_2 = obj.get_hits(timestamp)

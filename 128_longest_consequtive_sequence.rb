# @param {Integer[]} nums
# @return {Integer}
# Time complexity : O(n)

# Although the time complexity appears to be quadratic due to the while loop
# nested within the for loop, closer inspection reveals it to be linear.
# Because the while loop is reached only when currentNum marks the beginning
# of a sequence (i.e. currentNum-1 is not present in nums), the while loop can
# only run for nn iterations throughout the entire runtime of the algorithm.
# This means that despite looking like O(n \cdot n)O(n⋅n) complexity, the nested
# loops actually run in O(n + n) = O(n)O(n+n)=O(n) time. All other computations
# occur in constant time, so the overall runtime is linear.

# Space complexity : O(n).

# In order to set up O(1) containment lookups, we allocate linear space for a
# hash table to store the O(n) numbers in nums. Other than that, the space
# complexity is identical to that of the brute force solution.

def longest_consecutive(nums)
    longest_streak = 0
    num_set = Set.new nums

    num_set.each do |num|
        if !num_set.include?(num - 1)
            current_num = num
            current_streak = 1
            while num_set.include?(current_num + 1)
                current_num += 1
                current_streak += 1
            end
            longest_streak = [longest_streak,  current_streak].compact.max
        end
    end
    longest_streak
end

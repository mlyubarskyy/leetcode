# Time complexity : O(NlogN) in the average case,
# Space complexity : O(1).

def find_kth_largest(nums, k)
  nums.sort[-k]
end

# Time complexity : O(N) in the average case,
#  O(N^2) in the worst case.
# Space complexity : O(1).

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  # kth largest is (n - k)th smallest
  @nums = nums
  select(0, @nums.size - 1, @nums.size - k)
end

def partition left, right, pivot_index
  pivot = @nums[pivot_index]

  # 1. move pivot to end
  @nums[pivot_index], @nums[right] = @nums[right], @nums[pivot_index]

  # 2. move all smaller elements to the left
  store_index = left
  (left...right).each do |i|
    if @nums[i] < pivot
      @nums[store_index], @nums[i] = @nums[i], @nums[store_index]
      store_index += 1
    end
  end

  # 3. move pivot to its final place
  @nums[right], @nums[store_index] = @nums[store_index], @nums[right]

  store_index
end

def select(left, right, k_smallest)
  # Returns the k-th smallest element of list within left..right

  @nums[left] if left == right

  # select a random pivot_index between
  pivot_index = (left..right).to_a.sample

  # find the pivot position in a sorted list
  pivot_index = partition(left, right, pivot_index)

  # the pivot is in its final sorted position
  if k_smallest == pivot_index
    @nums[k_smallest]
  elsif k_smallest < pivot_index
    # go left
    select(left, pivot_index - 1, k_smallest)
  else
    # go right
    select(pivot_index + 1, right, k_smallest)
  end
end

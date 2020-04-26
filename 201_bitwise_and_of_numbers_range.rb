# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
  while(m < n)
    # Brian Kernighan's Algorithm O(1)
    # `-m` is the 2's complement of `n`
    # when do bitwise or with `n` we
    # get LSB and we subtract that from `n`
    n -= (n & -n)
  end
  n
end

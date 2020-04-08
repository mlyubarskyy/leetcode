# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  l,r = 1, n

  while l < r
    mid = (r+l)/2
    if is_bad_version(mid) # 2
      # go left
      r = mid
    else
      # go right
      l = mid + 1
    end
  end

  l
end

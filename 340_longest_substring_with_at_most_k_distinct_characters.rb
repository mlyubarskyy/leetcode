# @param {String} s
# @param {Integer} k
# @return {Integer}
def length_of_longest_substring_k_distinct(s, k)
  return 0 if k == 0 || s == ''

  max_len = 1
  map = {}

  left, right = 0, 0

  while right < s.size
    map[s[right]] = right
    right += 1

    if map.size == k + 1
      del_idx = map.values.min
      map.delete(s[del_idx])
      left = del_idx + 1
    end
    max_len = [max_len, right-left].max
  end

  max_len
end

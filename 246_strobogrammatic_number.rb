# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)
  hsh = {
    '0' => '0',
    '1' => '1',
    '6' => '9',
    '8' => '8',
    '9' => '6',
  }

  l, r = 0, num.size-1
  while l <= r
    lv, rv = num[l], num[r]
    if hsh[lv] != rv
      return false
    end
    l += 1
    r -= 1
  end

  true
end

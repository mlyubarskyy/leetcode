# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return true if s.empty?
  s = s.downcase.scan(/[a-z0-9]/)
  i=0
  len = s.size
  while i < len/2
    return false if s[i] != s[len-1-i]
    i+=1
  end

  true
end

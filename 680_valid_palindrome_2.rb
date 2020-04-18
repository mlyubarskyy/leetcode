# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  mid = s.size / 2

  (0...mid).each do |i|
    if s[i] != s[~i]
      return s[i..~i-1].reverse == s[i..~i-1] || s[i+1..~i].reverse == s[i+1..~i]
    end
  end

  true
end

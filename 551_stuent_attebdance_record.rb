# @param {String} s
# @return {Boolean}
def check_record(s)
  abscenses = 0

  (0...s.size).each do |i|
    abscenses += 1 if s[i] == 'A'
    return false if i-1 >= 0 && i-2 >= 0 && s[i-1] == 'L' && s[i-2] == 'L' && s[i] == 'L'
    return false if abscenses > 1
  end
  true
end

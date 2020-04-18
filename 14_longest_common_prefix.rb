# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  flag = true
  prefix = ''
  while flag
    letters = strs.map do |str|
      return prefix if !ch = str[0]
      str[0] = ''
      ch
    end.uniq
    prefix << letters[0] if flag = letters.size == 1
  end
  prefix
end

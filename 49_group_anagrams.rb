# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  hsh = {}
  strs.each do |str|
    chrs = str.chars.sort.join

    hsh[chrs] ||= []
    hsh[chrs] << str
  end

  hsh.values
end

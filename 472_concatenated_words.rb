# @param {String[]} words
# @return {String[]}
def find_all_concatenated_words_in_a_dict(words)
  words = words.reject(&:empty?)
  dict = words.zip(Array.new(words.size, true)).to_h

  words.select do |word|
    dfs(word, dict)
  end
end

def dfs(word, dict)
  for i in 0..word.size
    prefix = word[0...i].to_s
    suffix = word[i..-1].to_s
    next if prefix == "" || suffix == ""

    return true if dict[prefix] && dict[suffix]
    return true if dict[prefix] && dfs(suffix, dict)
  end

  false
end

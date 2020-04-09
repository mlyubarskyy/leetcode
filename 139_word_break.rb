# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  dict = Set.new(word_dict)
  visited = {}
  q = [0]

  while q.any?
    start = q.shift
    if !visited.has_key? start
      (start...s.length).each do |e|
        #puts [s[start..e], q].inspect

        if dict.include? s[start..e]
          q << (e+1)
          return true if !s[e+1]
        end
      end
      visited[start] = 1
    end
  end
  false
end

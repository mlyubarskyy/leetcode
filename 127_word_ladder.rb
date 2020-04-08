def ladder_length(begin_word, end_word, word_list)
  return 0 if !word_list.include? end_word

  dict = {}
  stack = [ [begin_word, 1] ]
  visited = {}

  word_list.each do |w|
    transformations(w).each do |tr|
      dict[tr] ||= []
      dict[tr] << w
    end
  end

  while stack.size > 0
    word, lvl = stack.shift

    transformations(word).each do |tr|
      next unless dict[tr]

      dict[tr].each do |a_word|
        return lvl + 1 if end_word == a_word
        next if visited[a_word]

        dict[tr] = []
        stack << [a_word, lvl+1]
        visited[a_word] = 1
      end
    end
  end

  0
end

def transformations(word)
  (word.size-1).downto(0).map do |i|
    word.dup.tap{ |w| w[i] = '*' }
  end
end

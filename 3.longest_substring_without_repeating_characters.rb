def length_of_longest_substring(s)
    map = {}
    i=0; j=0
    res = 0

    while j < s.length
      if map[s[j]]
        i = [map[s[j]], i].max
      end
      res = [res, j - i + 1].max
      map[s[j]] = j+1
      j += 1
    end

    res
end

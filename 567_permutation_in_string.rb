# @param {String} s1
# @param {String} s2
# @return {Boolean}

# Time complexity : O(l2)
# Space complexity : O(1)O(1)

def check_inclusion(s1, s2)
  return false if s1.length > s2.length
  s1map, s2map = [0] * 26, [0] * 26
  alpha = ('a'..'z').to_a.join

  (0...s1.size).each do |i|
    s1map[alpha.index(s1[i])] += 1
    s2map[alpha.index(s2[i])] += 1
  end

  count = 0
  26.times do |i|
    count += 1 if s1map[i] == s2map[i]
  end

  (0...(s2.size - s1.size)).each do |i|
    r = alpha.index s2[i + s1.size]
    l = alpha.index s2[i]
    return true if count == 26

    s2map[r] += 1
    if s2map[r] == s1map[r]
      count+=1
    elsif s2map[r] == s1map[r] + 1
      count-=1
    end
    s2map[l]-=1

    if s2map[l] == s1map[l]
      count+=1
    elsif s2map[l] == s1map[l] - 1
      count-=1
    end
  end

  count == 26
end

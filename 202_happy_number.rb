# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  seen = {}
  while n != 1 && seen[n] == nil
    seen[n] = sq = square(n)
    n = sq
  end
  return n == 1
end

def square(n)
  n.to_s.each_char.map do |c|
    i = c.to_i
    i * i
  end.sum
end

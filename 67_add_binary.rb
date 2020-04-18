# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  # (a.to_i(2) + b.to_i(2)).to_s(2)
  len = [b.size, a.size].max
  a = '0' * (len-a.size) << a
  b = '0' * (len-b.size) << b

  res = '0' * len
  carryover = 0
  (0...len).each do |index|
    i = ~index # goin backwards
    int_a = a[i] == '1' ? 1 : 0
    int_b = b[i] == '1' ? 1 : 0

    res[i] = (int_a ^ int_b ^ carryover).to_s
    carryover = "#{a[i]}#{b[i]}#{carryover}".count('1') > 1 ? 1 : 0
  end

  res = '1' << res if carryover == 1
  res
end

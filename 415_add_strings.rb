# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  max_len = [num1.size, num2.size].max
  num1 = '0' * (max_len - num1.size) << num1
  num2 = '0' * (max_len - num2.size) << num2
  carryover = 0
  result = []

  (0...max_len).each do |idx|
    carryover, res = (
      num1[~idx].to_i +
      num2[~idx].to_i +
      carryover
    ).divmod(10)
    result.unshift res
  end
  result.unshift(carryover) if carryover > 0

  result.join
end

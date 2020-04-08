# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  return false if n < 1

  while n % 3 == 0
    n /= 3
  end
  return n == 1
end

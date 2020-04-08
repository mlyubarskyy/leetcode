# @param {Integer} x
# @return {Integer}
def reverse(x)
    minus = x < 0 ? -1 : 1

    y = 0
    x = x * minus
    while x > 0 do
        y = y*10
        y = y + (x%10)
        x = x/10
    end
    res = y * minus
    res = 0 if res.bit_length > 31
    res
end

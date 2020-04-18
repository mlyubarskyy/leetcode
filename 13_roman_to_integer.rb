# @param {String} s
# @return {Integer}
def roman_to_int(s)
    conv = {
        1 => 'I',
        4 => 'IV',
        5 => 'V',
        9 => 'IX',

        10 => 'X',
        40 => 'XL',
        50 => 'L',
        90 => 'XC',

        100 => 'C',
        400 => 'CD',
        500 => 'D',
        900 => 'CM',

        1000 => 'M'
    }

    res = 0
    while s.length > 0
        conv.reverse_each do |num, roman|
            if s.start_with?(roman)
                s = s[roman.size..-1]
                res += num
            end
        end
    end
    res
end

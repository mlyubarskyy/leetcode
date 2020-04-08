# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity_ii(a)
    i = 0
    e = 0
    o = 1
    res = []
    while i < a.length # n
        if a[i] % 2 == 0
            res[e] = a[i]
            e+=2
        else
            res[o] = a[i]
            o+=2
        end
        i+=1
    end

    res
end

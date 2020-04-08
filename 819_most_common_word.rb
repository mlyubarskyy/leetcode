# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(par, banned)
    punctuation = par.tr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ", '').chars.uniq.join
    h = Hash.new(0)
    known_max = 0
    mcw = nil

    words = (par.downcase.tr(punctuation, ' ').split(' ') - banned)
    words.each do |w|
        next if banned.include? w
        h[w] += 1
        if h[w] > known_max
            mcw = w
            known_max = h[w]
        end
    end

    mcw
end

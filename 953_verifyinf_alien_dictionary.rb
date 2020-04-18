# @param {String[]} words
# @param {String} order
# @return {Boolean}

ALPHA = ('a'..'z').to_a.freeze

def is_alien_sorted(words, order)
  words.each_cons(2).all? { |a, b| (translate(a, order) <=> translate(b, order)) <= 0 }
end

def translate word, order
  word.each_char.map do |c|
    ALPHA[order.index(c)]
  end.join
end

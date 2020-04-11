# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}

WORD_KEY = '$'
DIRECTIONS = [ [-1,0], [0,-1], [1,0], [0,1] ].freeze

def find_words(board, words)
  return [] if words == []

  trie = {}
  out = []

  words.each do |word|
    node = trie
    word.each_char do |ch|
      node = node[ch] ||= {}
    end
    node[WORD_KEY] = word
  end

  (0...board.size).each do |row|
    (0...row.size).each do |col|
      backtracking(board, row, col, trie, out)
    end
  end

  out
end

def backtracking(board, row, col, trie, matched_words)
  letter = board[row][col]
  curr_node = trie[letter]
  if !curr_node
    trie.delete(letter)
    return
  end

  word_match = curr_node.delete(WORD_KEY)
  if word_match
    matched_words << word_match
  end

  board[row][col] = '#'

  DIRECTIONS.each do |ri, ci|
    nrow, ncol = row+ri, col+ci
    next if nrow < 0 || nrow >= board.size
    next if ncol < 0 || ncol >= board[0].size
    next if !curr_node.include?(board[nrow][ncol])

    backtracking(board, nrow, ncol, curr_node, matched_words)
  end
  board[row][col] = letter
end

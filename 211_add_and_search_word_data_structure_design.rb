class WordDictionary
  EOF_CHAR = '$'

  def initialize()
    @root = {}
    @word_lengths = Set.new
  end

  def add_word(word)
    @word_lengths << word.size

    node = @root
    word.each_char do |c|
      node = node[c] ||= {}
    end
    node[EOF_CHAR] = word
    nil
  end

  def search(word)
    return false if !@word_lengths.include? word.size

    dfs @root, word, 0, found = []
    found.size > 0
  end

  def dfs curr_node, query, idx, found
    return if !curr_node || found.size > 0

    found << curr_node['$'] if query.size == idx && curr_node['$']
    char = query[idx]

    if char == '.'
      curr_node.each do |key, child_node|
        next if key == '$'
        dfs child_node, query, idx+1, found
      end
    else
      dfs curr_node[char], query, idx+1, found
    end
  end
end

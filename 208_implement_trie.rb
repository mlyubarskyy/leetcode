class Node
  attr_accessor :val, :is_end, :children

  def initialize(val)
    @val = val
    @is_end = is_end if is_end
    @children = {}
  end
end

class Trie
  attr_accessor :root
  def initialize
    @root = Node.new('')
  end

  def insert(word)
    node = @root
    len = word.size
    word.each_char.with_index do |c, i|
      node = node.children[c] ||= Node.new(c)
      node.is_end = true if i == len-1
    end
  end

  def search(word)
    deepest = get_deepest_node_for(word)
    deepest && !!deepest.is_end
  end

  def starts_with(prefix)
    node = get_deepest_node_for(prefix)
    node && node.val != ''
  end

  private

  def get_deepest_node_for(prefix)
    node = root
    prefix.each_char do |c|
      return false unless node = node.children[c]
    end
    node
  end
end


class Trie
  WORD_KEY = '$'.freeze

  def initialize
    @root = {}
  end

  def insert(word)
    node = @root
    word.each_char do |ch|
      node = node[ch] ||= {}
    end
    node[WORD_KEY] = word
  end

  def search(word)
    get_deepest_node_for(word)&.has_key?(WORD_KEY) || false
  end

  def starts_with(prefix)
    !get_deepest_node_for(prefix).nil?
  end

  private

  def get_deepest_node_for(prefix)
    node = @root
    prefix.each_char do |ch|
      node = node[ch]
      return nil if !node
    end
    node
  end
end

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

# Your Trie object will be instantiated and called as such:
 #obj = Trie.new()
 #obj.insert('apple')
 #param_2 = obj.search('apple')
 #param_3 = obj.starts_with('app')

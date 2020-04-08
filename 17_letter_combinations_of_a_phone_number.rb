# @param {String} digits
# @return {String[]}

class TreeNode
  attr_accessor :val, :children

  def initialize val
    @val = val
    @children = []
  end
end

def letter_combinations(digits)
  return [] if digits.empty?
  map = {
    '2' => ["a", "b", "c"],
    '3' => ["d", "e", "f"],
    '4' => ["g", "h", "i"],
    '5' => ["j", "k", "l"],
    '6' => ["m", "n", "o"],
    '7' => ["p", "q", "r", "s"],
    '8' => ["t", "u", "v"],
    '9' => [ "w", "x", "y", "z"]
  }

  root = TreeNode.new('')
  stack = [root]

  digits.each_char do |dig|
    tmp = []

    stack.each do |node|
      map[dig].each do |ch|
        nnode = TreeNode.new(ch)
        node.children << nnode
        tmp << nnode
      end
    end
    stack = tmp
  end

  out = []
  dfs(root, [], out)
  out
end

def dfs(root, path, paths)
  return if !root

  path << root.val
  if root.children == []
    paths << path.join
  else
    root.children.each do |child|
      dfs(child, path, paths)
    end
  end

  path.pop
end

# @param {String} path
# @return {String}
def simplify_path(path)
  stack = []

  path.split('/').each do |step|
    case step
    when '..'
      stack.pop if stack.any?
    when '.', ''
    else
      stack << step
    end
  end
  '/' << stack.join('/')
end

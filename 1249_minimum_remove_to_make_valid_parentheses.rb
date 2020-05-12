# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  # Parse 1: Remove all invalid ")"
  first_parse_chars = []
  balance = 0
  open_seen = 0
  s.each_char do |c|
    if c == "("
      balance += 1
      open_seen += 1
    end
    if c == ")"
      next if balance == 0
      balance -= 1
    end
    first_parse_chars << c
  end

  # Parse 2: Remove the rightmost "("
  result = []
  open_to_keep = open_seen - balance
  first_parse_chars.each do |c|
    if c == "("
      open_to_keep -= 1
      next if open_to_keep < 0
    end
    result << c
  end

  result.join
end

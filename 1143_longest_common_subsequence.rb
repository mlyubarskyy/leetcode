# @param {String} text1
# @param {String} text2
# @return {Integer}

# Time complexity : O(M⋅N)
# Like before, we're solving M⋅N subproblems, and each is an O(1) operation to solve.

# Space complexity : O( min(M,N) )
# We've reduced the auxilary space required so that we only use two 2D arrays at a time;
# each the length of the shortest input word.
# Seeing as the 22 is a constant, we drop it,
# leaving us with the minimum length out of the two words.



def longest_common_subsequence(text1, text2)
  text1, text = text2, text1 if text2.size < text1.size
  previous = Array.new(text1.size + 1) { 0 }

  (0...text2.size).reverse_each do |col|
    current = Array.new(text1.size + 1) { 0 }
    (0...text1.size).reverse_each do |row|
      if text2[col] == text1[row]
        current[row] = 1 + previous[row + 1]
      else
        current[row] = [previous[row], current[row + 1]].max
      end
    end
    previous = current
  end
  previous[0]
end

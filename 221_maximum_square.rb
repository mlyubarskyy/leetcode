# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  rows = matrix.size
  cols = matrix[0]&.size.to_i
  maxsqlen = 0

  (0...rows).each do |i|
    (0...cols).each do |j|
      if matrix[i][j] == '1'
        sqlen = 1
        flag = true

        while sqlen + i < rows && sqlen + j < cols && flag
          (j..sqlen+j).each do |k|
            if matrix[i+sqlen][k] == '0'
              flag = false
              break
            end
          end

          (i..sqlen+i).each do |k|
            if matrix[k][j+sqlen] == '0'
              flag = false
              break
            end
          end

          sqlen += 1 if flag
        end

        maxsqlen = sqlen if maxsqlen < sqlen
      end
    end
  end
  maxsqlen * maxsqlen
end

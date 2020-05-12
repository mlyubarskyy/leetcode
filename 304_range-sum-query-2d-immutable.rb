class NumMatrix

=begin
    :type matrix: Integer[][]
=end
    def initialize(matrix)
      return if (matrix.length == 0 || matrix[0].length == 0)
      @dp = Array.new(matrix.length + 1) { Array.new(matrix[0].length + 1) { 0 } }

      (0...matrix.length).each do |r|
        (0...matrix[0].length).each do |c|
          @dp[r+1][c+1] = @dp[r+1][c] + @dp[r][c+1] + matrix[r][c] - @dp[r][c]
        end
      end
    end


=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
    def sum_region(row1, col1, row2, col2)
      @dp[row2 + 1][col2 + 1] - @dp[row1][col2 + 1] -
        @dp[row2 + 1][col1] + @dp[row1][col1]
    end


end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)

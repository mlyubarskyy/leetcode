# """
# This is BinaryMatrix's API interface.
# You should not implement it, or speculate about its implementation
# """
# class BinaryMatrix
# 	def get(row, col)
# 		@return {Integer}
# 	end
#
# 	def dimensions()
# 		@return {List[Integer]}
# 	end
# end

# @param {BinaryMatrix} binaryMatrix
# @return {Integer}
def leftMostColumnWithOne(binaryMatrix)
  m, n = binaryMatrix.dimensions
  row = 0
  col = n

  left = 0
  right = n

  while row < m
    left = 0
    while left < right
      mid = (left + right) / 2
      if binaryMatrix.get(row , mid) == 1
        right = mid
      else
        left = mid + 1
      end
    end
    col = left
    row += 1
  end

  col == n ? -1 : col
end

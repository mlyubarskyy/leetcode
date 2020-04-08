# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    rows = matrix.length
    return false if rows == 0
    cols = matrix[0].length
    return false if cols == 0

    i, j = 0, cols-1
    while i < rows and j >= 0
        if matrix[i][j] < target
            i += 1
        elsif matrix[i][j] > target
            j -= 1
        else
            return true
        end
    end
    false
end

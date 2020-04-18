# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  points.sort_by {|a| a[0]**2 + a[1]**2}.first(k)
end

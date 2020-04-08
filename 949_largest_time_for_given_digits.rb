# @param {Integer[]} a
# @return {String}
def largest_time_from_digits(a)
  ans = -1

  a.permutation(4).each do |a,b,c,d|
    hrs = 10 * a + b
    min = 10 * c + d
    t = 60 * hrs + min
    ans = t if ans < t if min.between?(0, 59) && hrs.between?(0, 23)
  end
  ans >= 0 ? ans.divmod(60).map{|c| "%02d" % c}.join(":") : ""
end

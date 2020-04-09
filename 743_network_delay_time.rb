# @param {Integer[][]} times
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def network_delay_time(times, n, k)
  @graph = {}
  @dist = {}

  times.sort_by{|el| el.last}.each do |from, to, time|
    (@graph[from] ||= []) << [to, time]
  end

  (1..n).each do |node|
    @dist[node] = Float::INFINITY
  end

  dfs k, 0
  ans = @dist.values.max
  ans < Float::INFINITY ? ans : -1
end

def dfs node, elapsed
  return if elapsed >= @dist[node]

  @dist[node] = elapsed
  return if !@graph[node]
  @graph[node].each do |nei, time|
    dfs(nei, elapsed + time)
  end
end

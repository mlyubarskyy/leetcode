class SnapshotArray

=begin
    :type length: Integer
=end
  def initialize(length)
    @len = length
    @snapshots = [{}]
  end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
  def set(index, val)
    @snapshots.last[index] = val
  end

=begin
    :rtype: Integer
=end
  def snap()
    snap_id = @snapshots.count - 1
    @snapshots << @snapshots.last.dup
    snap_id
  end

=begin
    :type index: Integer
    :type snap_id: Integer
    :rtype: Integer
=end
  def get(index, snap_id)
    @snapshots[snap_id][index] || 0
  end
end

# Your SnapshotArray object will be instantiated and called as such:
# obj = SnapshotArray.new(length)
# obj.set(index, val)
# param_2 = obj.snap()
# param_3 = obj.get(index, snap_id)

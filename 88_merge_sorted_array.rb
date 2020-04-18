def merge(nums1, m, nums2, n)
  m_idx = 0
  n.times do |n_idx|
    el = nums2[n_idx] # 2, 5, 6
    while m_idx < nums1.size
      if nums1[m_idx] > el || m_idx == m
        nums1.pop
        nums1.insert m_idx, el
        m += 1
        break
      end
      m_idx += 1
    end
  end
end

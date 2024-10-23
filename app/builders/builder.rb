# Lớp Builder là giao diện cơ bản định nghĩa các phương thức xây dựng
class Builder
  # Phương thức xây dựng CPU, cần được triển khai trong các lớp con
  def build_cpu
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Phương thức xây dựng RAM, cần được triển khai trong các lớp con
  def build_ram
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Phương thức xây dựng Storage, cần được triển khai trong các lớp con
  def build_storage
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # Phương thức trả về đối tượng máy tính, cần được triển khai trong các lớp con
  def get_result
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

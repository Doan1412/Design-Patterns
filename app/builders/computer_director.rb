# app/builders/computer_director.rb
# Lớp ComputerDirector điều khiển quá trình xây dựng máy tính
class ComputerDirector
  # Phương thức construct sẽ yêu cầu builder xây dựng các phần của máy tính
  def construct(builder)
    # Gọi các phương thức xây dựng CPU, RAM và Storage của builder
    builder.build_cpu
    builder.build_ram
    builder.build_storage
  end
end

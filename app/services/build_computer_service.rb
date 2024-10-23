# app/services/build_computer_service.rb
# Service dùng để xây dựng máy tính chơi game
require_relative '../models/computer' # Import model Computer
require_relative '../builders/gaming_computer_builder' # Import builder GamingComputerBuilder
require_relative '../builders/computer_director' # Import director ComputerDirector

class BuildComputerService
  # Phương thức tự xây dựng một máy tính chơi game
  def self.build_gaming_computer
    # Tạo một đối tượng GamingComputerBuilder
    gaming_builder = GamingComputerBuilder.new
    # Tạo một đối tượng ComputerDirector
    director = ComputerDirector.new

    # ComputerDirector điều khiển quá trình xây dựng máy tính chơi game
    director.construct(gaming_builder)
    # Lấy máy tính sau khi đã được xây dựng
    gaming_computer = gaming_builder.get_result

    # Hiển thị cấu hình máy tính ra console
    gaming_computer.display_info
  end
end

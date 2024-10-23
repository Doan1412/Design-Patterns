# app/builders/gaming_computer_builder.rb
# Triển khai cụ thể builder cho GamingComputer (máy tính chơi game)
require_relative 'builder' # Import lớp Builder

class GamingComputerBuilder < Builder
  # Khởi tạo builder và tạo đối tượng máy tính trống
  def initialize
    @computer = Computer.new
  end

  # Định nghĩa phương thức xây dựng CPU cho máy tính chơi game
  def build_cpu
    @computer.cpu = 'Gaming CPU'
  end

  # Định nghĩa phương thức xây dựng RAM cho máy tính chơi game
  def build_ram
    @computer.ram = '16GB DDR4'
  end

  # Định nghĩa phương thức xây dựng Storage cho máy tính chơi game
  def build_storage
    @computer.storage = '1TB SSD'
  end

  # Phương thức trả về đối tượng máy tính sau khi đã xây dựng xong
  def get_result
    @computer
  end
end

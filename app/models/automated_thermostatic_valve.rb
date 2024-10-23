# app/models/automated_thermostatic_valve.rb
class AutomatedThermostaticValve < ActiveRecord::Base
  # Callback kiểm tra nhiệt độ tiếp theo trước khi xác thực
  before_validation :check_next_temperature, if: :next_temperature
  # Callback khởi động bộ sưởi sau khi lưu thành công
  after_save :launch_heater, if: :was_heat_up

  attr_accessor :next_degrees, :next_scale # Các thuộc tính tạm thời cho nhiệt độ tiếp theo
  attr_reader :was_heat_up # Để biết liệu bộ sưởi có được khởi động hay không

  # Phương thức trả về nhiệt độ hiện tại dưới dạng đối tượng Temperature
  def temperature
    Temperature.new(degrees, scale)
  end

  # Phương thức thiết lập nhiệt độ tiếp theo từ đối tượng Temperature
  def temperature=(temperature)
    assign_attributes(temperature.to_h)
  end

  # Phương thức trả về nhiệt độ tiếp theo dưới dạng đối tượng Temperature
  def next_temperature
    Temperature.new(next_degrees, next_scale) if next_degrees.present?
  end

  private

  # Kiểm tra và cập nhật nhiệt độ nếu điều kiện thỏa mãn
  def check_next_temperature
    @was_heat_up = false
    if temperature < next_temperature && next_temperature <= Temperature::MAX
      self.temperature = next_temperature # Cập nhật nhiệt độ
      @was_heat_up = true # Đánh dấu rằng bộ sưởi sẽ được khởi động
    end
  end

  # Khởi động bộ sưởi với nhiệt độ hiện tại
  def launch_heater
    Heater.call(temperature.kelvin_degrees) # Gọi bộ sưởi với nhiệt độ tính bằng Kelvin
  end
end

# app/models/temperature.rb
class Temperature
  include Comparable # Cho phép so sánh các đối tượng

  # Định nghĩa các đơn vị nhiệt độ được hỗ trợ
  SCALES = %w(kelvin celsius fahrenheit)
  DEFAULT_SCALE = 'kelvin'

  attr_reader :degrees, :scale, :kelvin_degrees # Các thuộc tính của đối tượng

  # Khởi tạo đối tượng Temperature với giá trị và đơn vị
  def initialize(degrees, scale = 'kelvin')
    @degrees = degrees.to_f # Chuyển đổi giá trị thành số thực
    @scale = case scale
             when *SCALES then scale
             else DEFAULT_SCALE
             end

    # Tính toán giá trị nhiệt độ trong Kelvin
    @kelvin_degrees = case @scale
                      when 'kelvin'
                        @degrees
                      when 'celsius'
                        @degrees + 273.15
                      when 'fahrenheit'
                        (@degrees - 32) * 5 / 9 + 273.15
                      end
  end

  # Phương thức tạo đối tượng từ độ Celsius
  def self.from_celsius(degrees_celsius)
    new(degrees_celsius, 'celsius')
  end

  # Phương thức tạo đối tượng từ độ Fahrenheit
  def self.from_fahrenheit(degrees_fahrenheit)
    new(degrees_fahrenheit, 'fahrenheit')
  end

  # Phương thức tạo đối tượng từ Kelvin
  def self.from_kelvin(degrees_kelvin)
    new(degrees_kelvin, 'kelvin')
  end

  # Phương thức so sánh nhiệt độ với một đối tượng Temperature khác
  def <=>(other)
    kelvin_degrees <=> other.kelvin_degrees
  end

  # Phương thức trả về hash cho phép gán thuộc tính
  def to_h
    { degrees: degrees, scale: scale }
  end

  # Định nghĩa nhiệt độ tối đa (25 độ Celsius)
  MAX = from_celsius(25)
end

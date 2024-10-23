# app/models/computer.rb
class Computer
  attr_accessor :cpu, :ram, :storage

  def initialize
    @cpu = ''
    @ram = ''
    @storage = ''
  end

  def display_info
    puts "Computer Configuration:"
    puts "CPU: #{@cpu}"
    puts "RAM: #{@ram}"
    puts "Storage: #{@storage}\n\n"
  end
end

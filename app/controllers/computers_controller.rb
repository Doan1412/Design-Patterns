# app/controllers/computers_controller.rb
class ComputersController < ApplicationController
  def build_gaming_computer
    # Gọi service để xây dựng máy tính chơi game
    BuildComputerService.build_gaming_computer
    render plain: "Gaming computer built and displayed in console!"
  end
end

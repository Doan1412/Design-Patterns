# app/controllers/automated_thermostatic_valves_controller.rb
class AutomatedThermostaticValvesController < ApplicationController
  # Hành động heat_up để cập nhật nhiệt độ cho valve
  def heat_up
    # Cập nhật nhiệt độ và đơn vị cho valve từ tham số yêu cầu
    valve.update(next_degrees: params[:degrees], next_scale: params[:scale])
    # Trả về kết quả dưới dạng JSON để thông báo liệu quá trình làm nóng có thành công hay không
    render json: { was_heat_up: valve.was_heat_up }
  end

  private

  # Tìm kiếm valve dựa trên ID được cung cấp trong tham số yêu cầu
  def valve
    @valve ||= AutomatedThermostaticValve.find(params[:id])
  end
end

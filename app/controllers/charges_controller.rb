class ChargesController < ApplicationController
  def create
    # Gọi CheckoutInteractor để xử lý thanh toán và bắt lỗi (nếu có)
    interactor = CheckoutInteractor.call(self)

    if interactor.success?
      redirect_to charges_path
    else
      flash[:error] = interactor.error
      redirect_to new_charge_path
    end
  end
end

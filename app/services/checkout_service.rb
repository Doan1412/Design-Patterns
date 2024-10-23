class CheckoutService
  # Định nghĩa hằng số mặc định cho đơn vị tiền tệ là USD
  DEFAULT_CURRENCY = 'USD'.freeze

  # Khởi tạo với các tham số từ controller (params)
  def initialize(params = {})
    @params = params
  end

  # Phương thức chính để tạo thanh toán với Stripe
  def call
    # Tạo một đối tượng thanh toán với các thuộc tính được định nghĩa
    Stripe::Charge.create(charge_attributes)
  end

  private

  attr_reader :params

  # Xác định đơn vị tiền tệ (sử dụng giá trị từ params hoặc mặc định là USD)
  def currency
    params[:currency] || DEFAULT_CURRENCY
  end

  # Chuyển đổi số tiền thành cent (Stripe yêu cầu số tiền là cent)
  def amount
    params[:amount].to_i * 100
  end

  # Tạo khách hàng nếu chưa có, lưu vào biến @customer để tránh gọi lại nhiều lần
  def customer
    @customer ||= Stripe::Customer.create(customer_attributes)
  end

  # Thuộc tính cần thiết để tạo một khách hàng trong Stripe
  def customer_attributes
    {
      email: params[:email],
      source: params[:source]
    }
  end

  # Thuộc tính cần thiết để tạo một khoản thanh toán trong Stripe
  def charge_attributes
    {
      customer: customer.id,
      amount: amount,
      description: params[:description],
      currency: currency
    }
  end
end

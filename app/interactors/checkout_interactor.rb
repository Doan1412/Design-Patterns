class CheckoutInteractor
  # Phương thức class để khởi tạo và gọi Interactor
  def self.call(context)
    interactor = new(context)  # Khởi tạo đối tượng với ngữ cảnh (context)
    interactor.run             # Chạy logic chính của interactor
    interactor                 # Trả về đối tượng interactor (chứa kết quả)
  end

  # Đọc lỗi nếu có
  attr_reader :error

  # Khởi tạo Interactor với context (ở đây là controller)
  def initialize(context)
    @context = context
  end

  def success?
    @error.nil?
  end

  # Phương thức chính, gọi CheckoutService và xử lý ngoại lệ
  def run
    # Gọi CheckoutService với params từ context (controller)
    CheckoutService.new(context.params).call
  rescue Stripe::CardError => exception
    fail!(exception.message)
  end

  private

  attr_reader :context

  # Phương thức để gán lỗi khi thất bại
  def fail!(error)
    @error = error
  end
end

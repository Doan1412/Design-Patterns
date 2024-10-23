class UserForm
  include ActiveModel::Model

  attr_accessor :email, :full_name, :password, :password_confirmation

  VALID_ATTRIBUTES = %i(email full_name password password_confirmation).freeze

  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :full_name, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def save
    return false unless valid?

    user = User.new(email:, full_name:, password:)
    user.save
  end
end

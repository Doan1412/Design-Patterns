class UserAdapter
  def initialize external_user_api
    @external_user_api = external_user_api
  end

  def name
    @external_user_api.fetch_user["full_name"]
  end

  def email
    @external_user_api.fetch_user["email_address"]
  end
end

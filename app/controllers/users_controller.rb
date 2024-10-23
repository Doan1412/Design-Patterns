class UsersController < ApplicationController
  def new
    @user_form = UserForm.new
  end

  def create
    @user_form = UserForm.new user_params

    if @user_form.save
      redirect_to root_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def show
    external_user_api = ExternalUserAPI.new
    adapter = UserAdapter.new(external_user_api)
    user_presenter = UserPresenter.new

    @user_info = user_presenter.display(adapter)
  end

  private

  def user_params
    params
      .require(:user)
      .permit(UserForm::VALID_ATTRIBUTES)
  end
end

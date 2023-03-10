class PasswordsController < ApplicationController
  before_action :require_user_logged_in!
  def edit
  end
  def update
    if Current.user.update(password_params)
      redirect_to "/", notice: "Password updated"
    else
      redirect_to "/password", alert: "Password and password confirmation do not match"
    end
  end
  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
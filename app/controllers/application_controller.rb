class ApplicationController < ActionController::Base
  auto_session_timeout 5.minute
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to login_path, alert: "Please log in to access that." if Current.user.nil?
  end
end
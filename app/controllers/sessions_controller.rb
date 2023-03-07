class SessionsController < ApplicationController
  auto_session_timeout_actions
  def new
  end
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/", notice: "Logged in successfully"
    else
      redirect_to "/login", alert: "Invalid email or password"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to "/", notice: "Logged out"
  end
  def active
    render_session_status
  end
  def timeout
    render_session_timeout
  end
end
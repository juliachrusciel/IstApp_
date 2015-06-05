class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate!
    if session[:user_id]
    @current_user = User.find(session[:user_id])
  end

  def admin_authenticate!
    redirect_to '/' unless (current_user && current_user.is_admin)
  end

end

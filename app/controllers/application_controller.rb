class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(token: session[:user_token]) if session[:user_token]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to "/login" unless current_user
  end

  def authenticate_admin!
    redirect_to "/login" unless current_user.admin
  end
end

class SessionsController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      binding.pry
      session[:user_token] = user.token
      redirect_to "/"
    else
      binding.pry
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_token] = nil
    redirect_to "/login"
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authenticate_admin!, only: [:new, :create]

  def index
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_token] = user.token
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end
end

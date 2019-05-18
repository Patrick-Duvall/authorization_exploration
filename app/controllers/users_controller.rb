class UsersController < ApplicationController
  before_action :require_login, only: :secret

  def index
    @users = User.all
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def secret

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "Login Required"
      redirect_to login_path
    end
  end
end

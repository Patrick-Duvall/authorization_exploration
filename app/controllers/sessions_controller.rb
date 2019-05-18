class SessionsController < ApplicationController

  def login

    # redirect_to login_path
  end

  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user == nil
      redirect_to login_path
      return
    else
      session[:user_id] = @user.id
      redirect_to users_path
    end
  end

  def destroy #logout
    session[:user_id] = nil
    redirect_to users_path
  end


end

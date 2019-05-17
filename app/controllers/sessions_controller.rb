class SessionsController < ApplicationController

  def login

  end

  def create
    @user = User.find_by(email: params[:email], password: params[:password])
    require 'pry'; binding.pry

    if @user == nil
      redirect_to login_path
      return
    else

    end

    redirect_to users_path
  end


end

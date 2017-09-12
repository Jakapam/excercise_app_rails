class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

  def new
  end

  def create

    @user = User.find_by(username: params[:user][:username])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end

class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

  def new
  end

  def create

    @user = User.find_by(username: params[:user][:username])

    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "Please enter a valid username or password"
      render :new
    end

  end

  def destroy
    session.clear
    flash[:message] = "Thank you for using our app!"
    redirect_to root_path
  end

end

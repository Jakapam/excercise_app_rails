class UsersController < ApplicationController
  before_action :require_login, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def welcome

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    render :welcome

  end

  def update
    render :welcome

  end

  def destroy
    render :welcome

  end
private

def require_login
  redirect_to "/" unless session.include? :user_id
end

def user_params
  params.require(:user).permit(:first_name, :last_name, :username, :password )
end
end

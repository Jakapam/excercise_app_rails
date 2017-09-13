class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit]

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

  def index
    @users = User.all
  end

  def welcome

    if session[:user_id]
      redirect_to user_path(session[:user_id])
    end

  end



  def show
    @user = User.find(params[:id])
    @routines = @user.routines
    @issued_challenges = @user.issued_challenges
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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password )
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def must_be_valid_user
    if @user.id != session[:user_id]
      flash[:message] = "Not authorized to make changes or view this page."
      redirect_to user_path(@user)
    end
  end

  def require_login
    if !session.include? :user_id
      flash[:message] = "Please log in to view this page"
      redirect_to "/"
    end
  end


end

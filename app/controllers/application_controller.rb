class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def must_be_valid_user
    if @user.id != session[:user_id]
      flash[:message] = "Not authorized to make changes or view this page."
      redirect_to user_path(@user)
    end
  end

  def require_login
    flash[:message] = "Please log in to view this page"
    redirect_to "/" unless session.include? :user_id
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

end

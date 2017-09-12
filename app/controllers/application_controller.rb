class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_login
    flash[:message] = "Please log in to view this page"
    redirect_to "/" unless session.include? :user_id
  end

end

class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
    @user = User.find_by(id: session[:user_id])
  end

  def create

  end

end

class ChallengesController < ApplicationController

  before_action :set_user, :set_challenge
  before_action :require_login, only: [:new, :create]

  def accept
    self.accept
    render :show
  end

  def reject
    self.reject
    render :show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.challenger_id = session[:user_id]

    if @challenge.save
      redirect_to user_challenge_path(@challenge.challenger, @challenge)
    else
      render :new
    end

  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
  end

  def index
    @issued_challenges = Challenge.all.where("challenger_id = ? AND completed = 'false' AND accepted = 'false' AND rejected = 'false'", @user.id)
    @received_challenges = Challenge.all.where("challengee_id = ? AND completed = 'false' AND accepted = 'false' AND rejected = 'false'", @user.id)
  end


  private

  def set_challenge
    @challenge = Challenge.find_by(id: params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def challenge_params
    params.require(:challenge).permit(:exercise_name, :challengee_name, :exercise_id, :sets, :reps, :weight, :time)
  end


end

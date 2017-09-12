class ChallengesController < ApplicationController

  before_action :set_user, :set_challenge
  before_action :require_login, only: [:new, :create]

  def accept
    @challenge.accept
    redirect_to user_challenges_path(@user)
  end

  def reject
    @challenge.reject

    redirect_to user_challenges_path(@user)
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

    @accepted_challenges = @user.accepted_challenges
    @rejected_challenges = @user.rejected_challenges
    @completed_challenges = @user.completed_challenges
  

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

class ChallengesController < ApplicationController

  before_action :set_user, :set_challenge
  before_action :require_login
  before_action :must_be_valid_user, only: [:complete, :accept, :reject]

  def complete
    @challenge.complete
    redirect_to user_challenges_path(@user)
  end

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
      redirect_to user_challenges_path(@challenge.challenger)
    else
      flash[:message] = "Whoops! Please make you've entered a valid username and/or a valid exercise."
      redirect_to new_user_challenge_path(@user)
    end

  end

  def show
    @challenge = Challenge.find_by(id: params[:id])
  end

  def index

    @issued_challenges = @user.issued_challenges.where(completed: false, accepted: false, rejected: false)
    @received_challenges = @user.received_challenges.where(completed: false, accepted: false, rejected: false)
    @completed_issued_challenges = @user.issued_challenges.where(completed: true)

    @accepted_challenges = @user.accepted_challenges
    @rejected_challenges = @user.rejected_challenges
    @completed_challenges = @user.completed_challenges

  end


  private

  def set_challenge
    @challenge = Challenge.find_by(id: params[:id])
  end



  def challenge_params
    params.require(:challenge).permit(:exercise_name, :challengee_name, :exercise_id, :sets, :reps, :weight, :time)
  end


end

class RoutinesController < ApplicationController

    before_action :require_login, only: [:new, :edit, :create, :show]

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.user_id = session[:user_id]
    if @routine.save
      redirect_to @routine
    else
      render :new
    end
  end

  def edit
    @routine = Routine.find_by(id: params[:id])
  end

  def index
    @user = User.find_by(id: session[:user_id])
    @routines = Routine.all.where('user_id = ?', @user.id)
  end

  def update
    @routine = Routine.find_by(id: params[:id])
    @routine.assign_attributes(routine_params)
    if @routine.save
      redirect_to @routine
    else
      render :edit
    end
  end

  def show
    @routine = Routine.find_by(id: params[:id])
    @exercises = @routine.routine_exercises
  end

  private

  def routine_params
    params.require(:routine).permit(:name)
  end
end

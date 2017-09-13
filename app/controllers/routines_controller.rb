class RoutinesController < ApplicationController

    before_action :set_routine, only: [:show, :edit, :update]
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

  end

  def index
    @user = User.find_by(id: session[:user_id])
    @routines = Routine.all.where('user_id = ?', @user.id)
  end

  def update

    @routine.assign_attributes(routine_params)

    if @routine.save
      redirect_to @routine
    else
      render :edit
    end
  end

  def show
    @exercises = @routine.routine_exercises
  end

  private

  def set_routine
    @routine = Routine.find_by(id: params[:id])
  end

  def routine_params
    params.require(:routine).permit(:name)
  end
end

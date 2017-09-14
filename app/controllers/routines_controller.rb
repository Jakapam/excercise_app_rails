class RoutinesController < ApplicationController

    before_action :set_user, :require_login
    before_action :set_routine, only: [:show, :edit, :update, :destroy]
    before_action :must_be_valid_user, only: [:destroy, :create]


  def new
    @routine = Routine.new
  end

  def create

    @routine = Routine.new(routine_params)
    @routine.user = @user

    if @routine.save
      redirect_to user_routine_path(@user, @routine)
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

    @week_hash = {
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
      saturday: [],
      sunday: []
    }

    @exercises.each do |exercise|
      @week_hash[:monday] << exercise if exercise.monday
      @week_hash[:tuesday] << exercise if exercise.tuesday
      @week_hash[:wednesday] << exercise if exercise.wednesday
      @week_hash[:thursday] << exercise if exercise.thursday
      @week_hash[:friday] << exercise if exercise.friday
      @week_hash[:saturday] << exercise if exercise.saturday
      @week_hash[:sunday] << exercise if exercise.sunday
    end

  end

  def destroy
    @routine.destroy
    redirect_to user_routines_path(@user)
  end

  private

  def set_routine
    @routine = Routine.find_by(id: params[:id])
  end

  def routine_params
    params.require(:routine).permit(:name)
  end
end

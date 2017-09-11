class RoutinesController < ApplicationController

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.user_id = 1
    if @routine.save

      redirect_to @routine
    else
      render :new
    end
  end

  def edit
    @routine = Routine.find_by(id: params[:id])
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
  end

  private

  def routine_params
    params.require(:routine).permit(:name)
  end
end

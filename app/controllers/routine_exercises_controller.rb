class RoutineExercisesController < ApplicationController
  def new
    @routine_exercise = RoutineExercise.new
    @routine_exercise.routine_id = params[:routine_id]
    @routine_exercise
  end

  def create
    @routine_exercise = RoutineExercise.new
    # @routine.user_id = 1
    # if @routine.save
    #
    #   redirect_to @routine
    # else
    #   render :new
    # end
  end


end

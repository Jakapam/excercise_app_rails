class RoutineExercisesController < ApplicationController



  def new
    @routine_exercise = RoutineExercise.new
    @routine = Routine.find_by(id: params[:routine_id])
    @routine_exercise
  end

  def create
    @routine_exercise = RoutineExercise.new
    byebug
    # @routine.user_id = 1
    # if @routine.save
    #
    #   redirect_to @routine
    # else
    #   render :new
    # end
  end

 private

 def routine_exercise_params
   params.require(:routine_exercise).permit(:sets, :reps, :weight, :time)
 end

end

class RoutineExercisesController < ApplicationController



  def new
    @routine_exercise = RoutineExercise.new
    @routine = Routine.find_by(id: params[:routine_id])
    @routine_exercise
  end

  def create
    @routine_exercise = RoutineExercise.new(routine_exercise_params) #compact?)
    @routine_exercise.routine_id = params[:routine_id]
    if @routine_exercise.save
      redirect_to routine_path(params[:routine_id])
    else
      render :new
    end
  end

 private

 def routine_exercise_params
   params.require(:routine_exercise).permit(:name, :sets, :reps, :weight, :time)
 end

end

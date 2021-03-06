class ExercisesController < ApplicationController

    before_action :require_login

    def show
      @exercise = Exercise.find_by(id: params[:id])
      if !@exercise
        flash[:message] = "Sorry, that exercise does not exist in our database"
        redirect_to users_path
      end
    end

    def edit
      @exercise = Exercise.find_by(id: params[:id])
    end

    def update
      @exercise = Exercise.find_by(id: params[:id])
      @exercise.assign_attributes(exercise_params)
      if @exercise.save
        redirect_to exercise_path(@exercise)
      else
        render :edit
      end
    end

    private
    def exercise_params
      params.require(:exercise).permit(:description)
    end
end

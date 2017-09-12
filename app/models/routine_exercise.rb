class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise

  def name

  end

  def name=(name)
    @exercise = Exercise.find_or_create_by(name: name)
    self.exercise = @exercise
  end

end

class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise

  def name
    if self.exercise.name
      self.exercise.name
    end
  end

  def name=(name)
    @exercise = Exercise.find_or_create_by(name: name)
    self.exercise = @exercise
  end

end

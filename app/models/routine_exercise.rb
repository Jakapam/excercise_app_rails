class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise


  def name
    if self.exercise
      self.exercise.name
    end
  end

  def name=(name)
    @exercise = Exercise.find_or_create_by(name: name)
    self.exercise = @exercise
  end

  def one_rep_max
    if self.weight >= 1 && self.reps >= 1
      self.weight * (1 + (self.reps/30))
    end
  end

end

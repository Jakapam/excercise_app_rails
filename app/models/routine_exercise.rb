class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise
  
  validates :exercise_id, presence: true

  def name
    if self.exercise
      self.exercise.name.titleize
    end
  end

  def name=(name)
    @exercise = Exercise.find_or_create_by(name: name.downcase)
    self.exercise = @exercise
  end

  def one_rep_max
    if !!self.weight && !!self.reps
      if self.reps == 1
        self.weight
      else
        (self.weight.to_f * (1.0 + (self.reps.to_f/30.to_f))).round
      end
    end
  end

end

class Challenge < ApplicationRecord

  belongs_to :exercise
  belongs_to :challenger, :class_name => "User"
  belongs_to :challengee, :class_name => "User"

  validates :exercise_id, presence: true
  validate :cant_challenge_self

  def one_rep_max
    if !!self.weight && !!self.reps
      if self.reps == 1
        self.weight
      else
        (self.weight.to_f * (1.0 + (self.reps.to_f/30.to_f))).round
      end
    end
  end

  def accept
    self.accepted = true
    self.save
  end

  def reject
    self.accepted = false
    self.rejected = true
    self.save
  end

  def complete
    self.completed = true
    self.save
  end


  def challengee_name
    @challengee = User.find_by(id: self.challengee_id)

    if @challengee
      @challengee.username
    end
  end

  def challengee_name=(name)
    @challengee = User.find_by(username: name)
    self.challengee = @challengee
  end

  def exercise_name
    if self.exercise
      self.exercise.name.titleize
    end
  end

  def exercise_name=(name)
    @exercise = Exercise.find_or_create_by(name: name.downcase)
    self.exercise = @exercise
  end

  private

  def cant_challenge_self
    if challenger_id == challengee_id
      errors.add(:challengee, "Cannot issue challenge to yourself")
    end
  end

end

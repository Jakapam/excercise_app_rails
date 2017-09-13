class Challenge < ApplicationRecord

  belongs_to :exercise
  belongs_to :challenger, :class_name => "User"
  belongs_to :challengee, :class_name => "User"

  


  def accept
    self.accepted = true
    self.save
  end

  def reject
    self.accepted = false
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
      self.exercise.name
    end
  end

  def exercise_name=(name)
    @exercise = Exercise.find_or_create_by(name: name)
    self.exercise = @exercise
  end

end

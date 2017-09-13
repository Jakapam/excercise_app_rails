class User < ApplicationRecord
  has_many :routines
  has_many :routine_exercises, through: :routines

  has_many :issued_challenges, :class_name => "Challenge", :foreign_key => 'challenger_id'
  has_many :received_challenges, :class_name => "Challenge", :foreign_key => 'challengee_id'

  validates :username, uniqueness: true, presence: true

  has_secure_password

  def to_s
    first_name + " " + last_name
  end

  def rejected_challenges
    self.issued_challenges.where(rejected: true)
  end

  def accepted_challenges
    self.received_challenges.where(accepted: true, completed: false)
  end

  def completed_challenges
    self.received_challenges.where(completed: true)
  end

end

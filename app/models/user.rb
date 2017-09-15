class User < ApplicationRecord
  has_many :routines
  has_many :routine_exercises, through: :routines

  has_many :issued_challenges, :class_name => "Challenge", :foreign_key => 'challenger_id'
  has_many :received_challenges, :class_name => "Challenge", :foreign_key => 'challengee_id'

  before_save { self.email = email.downcase }

  validates :username, uniqueness: true, presence: true, length: {in: 4..15}
  validates :email, uniqueness: true, presence: true, length: {in: 5..20}
  validates :first_name, :last_name, presence: true, length: {maximum: 30}

  validates_confirmation_of :password
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

  def number_of_issued
    self.issued_challenges.count
  end

  def number_of_accepts
    self.received_challenges.where(accepted: true, completed: false).count
  end

  def number_of_completes
    self.received_challenges.where(completed: true).count
  end

  def number_of_pending
    number_of_accepts - number_of_completes
  end

end

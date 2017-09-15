class Exercise < ApplicationRecord
  has_many :routine_exercises
  has_many :routines, through: :routine_exercises
  before_save { self.name = name.downcase }

  validates :name, presence: true, length: { in: 3..40 }
  validates :description, length: {maximum: 500}
  validates_format_of :name, :with => /[a-z]/i

end

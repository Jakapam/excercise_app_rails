class Routine < ApplicationRecord
  belongs_to :user
  has_many :routine_exercises
    accepts_nested_attributes_for :routine_exercises
  has_many :exercises, through: :routine_exercises

  validates :name, presence: true, length: {maximum: 144}
  validate :user_must_have_unique_routine_names

end

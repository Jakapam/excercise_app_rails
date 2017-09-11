class User < ApplicationRecord
  has_many :routines
  has_many :routine_exercises, through: :routines

end

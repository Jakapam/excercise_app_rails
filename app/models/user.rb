class User < ApplicationRecord
  has_many :routines
  has_many :routine_exercises, through: :routines

  has_secure_password

  def to_s
    first_name + " " + last_name
  end

end

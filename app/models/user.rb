class User < ApplicationRecord
  has_many :routines
  has_many :routine_exercises, through: :routines

  has_many :issued_challenges, :class_name => "Challenge", :foreign_key => 'challenger_id'
  has_many :received_challenges, :class_name => "Challenge", :foreign_key => 'challengee_id'

  has_secure_password

  def to_s
    first_name + " " + last_name
  end

end

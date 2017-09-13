class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.boolean :accepted, default: false
      t.boolean :completed, default: false
      t.boolean :rejected, default: false
      t.integer :exercise_id
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.float :time

      t.timestamps
    end
  end
end

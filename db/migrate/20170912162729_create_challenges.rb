class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.boolean :accepted
      t.boolean :completed
      t.integer :exercise_id
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.float :time

      t.timestamps
    end
  end
end

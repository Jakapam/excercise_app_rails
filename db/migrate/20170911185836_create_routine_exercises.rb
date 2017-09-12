class CreateRoutineExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :routine_exercises do |t|
      t.integer :routine_id
      t.integer :exercise_id
      t.integer :days_of_week

      t.string :string
      t.integer :sets
      t.integer :reps
      t.float :time
      t.integer :weight

      t.timestamps
    end
  end
end

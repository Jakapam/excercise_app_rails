class CreateRoutineExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :routine_exercises do |t|
      t.integer :routine_id
      t.integer :exercise_id
      t.string :day_of_week
      t.string :string

      t.timestamps
    end
  end
end

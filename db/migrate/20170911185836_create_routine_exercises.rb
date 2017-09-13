class CreateRoutineExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :routine_exercises do |t|
      t.integer :routine_id
      t.integer :exercise_id

      t.string :string
      t.integer :sets
      t.integer :reps
      t.float :time
      t.integer :weight

      t.boolean :monday, default: false
      t.boolean :tuesday, default: false
      t.boolean :wednesday, default: false
      t.boolean :thursday, default: false
      t.boolean :friday, default: false
      t.boolean :saturday, default: false
      t.boolean :sunday, default: false

      t.timestamps
    end
  end
end

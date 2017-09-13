class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.string :primary_muscle_group
      t.string :secondary_muscle_group
      t.timestamps
    end
  end
end

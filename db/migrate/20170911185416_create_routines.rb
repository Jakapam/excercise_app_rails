class CreateRoutines < ActiveRecord::Migration[5.1]
  def change
    create_table :routines do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end

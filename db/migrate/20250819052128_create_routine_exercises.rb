class CreateRoutineExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :routine_exercises do |t|
      t.references :exercises, null: false, foreign_key: true
      t.references :routines, null: false, foreign_key: true

      t.timestamps
    end
  end
end

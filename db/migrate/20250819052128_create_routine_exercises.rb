class CreateRoutineExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :routine_exercises do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :routine, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRoutines < ActiveRecord::Migration[7.1]
  def change
    create_table :routines do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :goal
      t.string :equipment
      t.string :comments

      t.timestamps
    end
  end
end

class AddColumnsToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :muscle_group, :string
    add_column :exercises, :img_url, :string
  end
end

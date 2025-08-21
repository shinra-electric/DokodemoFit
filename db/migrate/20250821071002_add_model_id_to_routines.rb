class AddModelIdToRoutines < ActiveRecord::Migration[7.1]
  def change
    add_column :routines, :model_id, :string
  end
end

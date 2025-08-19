class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :routine, null: false, foreign_key: true
      t.string :content
      t.string :role

      t.timestamps
    end
  end
end

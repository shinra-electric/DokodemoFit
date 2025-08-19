class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :body_type, :string
    add_column :users, :weight, :float
    add_column :users, :year_of_birth, :integer
    add_column :users, :profile_pic_url, :string
    add_column :users, :gender, :string
  end
end

class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name,      :string
    add_column :users, :firstname,      :string
    add_column :users, :lastname,       :string
    add_column :users, :date_of_birth, :date
  end
end

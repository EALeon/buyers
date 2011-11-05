class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string  :name
      t.text    :description
      t.float   :price
      t.integer :user_id
      t.integer :city_id
      t.timestamps
    end
  end
end

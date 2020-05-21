class AddBuy < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seller, :references,  foreign_key: { to_table: :users},  null: false
    add_column :items, :buyer, :references,  foreign_key: { to_table: :users},  null: false
  end
end

class CreateUserProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_products do |t|
      t.bigint :item_id, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: { to_table: :users}
      t.references :buyer, null: false, foreign_key: { to_table: :users}
      t.timestamps
    end
  end
end

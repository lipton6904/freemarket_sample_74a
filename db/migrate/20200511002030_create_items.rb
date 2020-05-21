class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price_id, null: false
      t.text :explanation, null: false
      t.bigint :category_id, foreign_key: true
      t.integer :size_id
      # t.references :brand, foreign_key: true
      t.integer :condition_id, null: false
      t.integer :derivery_fee_id, null: false
      t.string :shipping_area, null: false
      t.integer :days_untill_shipping_id, null: false
      t.integer :status_id
      t.timestamps
    end
  end
end

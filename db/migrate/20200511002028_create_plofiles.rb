class CreatePlofiles < ActiveRecord::Migration[5.2]
  def change
    create_table :plofiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.integer :post_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building, null: true
      t.string :tell_number, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

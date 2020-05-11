class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.date :birth_year, null: false
      t.date :birth_month, null: false
      t.date :birth_day, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end

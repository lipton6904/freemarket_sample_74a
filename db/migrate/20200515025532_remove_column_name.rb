class RemoveColumnName < ActiveRecord::Migration[5.2]
  def change
    remove_columns :users, :first_name, :last_name, :first_name_kana, :last_name_kana
  end
end

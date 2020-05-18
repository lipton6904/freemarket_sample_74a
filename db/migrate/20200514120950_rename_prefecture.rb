class RenamePrefecture < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :prefecture, :prefecture_id
  end
end

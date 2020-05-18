class RenameData < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :prefecture_id, :integer
  end
end

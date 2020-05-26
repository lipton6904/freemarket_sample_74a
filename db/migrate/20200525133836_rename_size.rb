class RenameSize < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :size_id, :string
    rename_column :items, :size_id, :size
    
  end
end

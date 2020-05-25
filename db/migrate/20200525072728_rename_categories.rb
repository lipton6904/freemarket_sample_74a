class RenameCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :category_id, :categorie_id
  end
end

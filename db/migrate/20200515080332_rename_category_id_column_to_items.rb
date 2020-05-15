class RenameCategoryIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :category_id, :category
  end
end

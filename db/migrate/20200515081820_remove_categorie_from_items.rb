class RemoveCategorieFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :categorie_id, :bigint
  end
end

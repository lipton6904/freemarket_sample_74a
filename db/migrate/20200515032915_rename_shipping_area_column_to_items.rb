class RenameShippingAreaColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :shipping_area, :shipping_area_id
  end
end

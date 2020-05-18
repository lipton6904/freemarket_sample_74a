class ChangeDatatypeShippingAreaIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipping_area_id, :integer
  end
end

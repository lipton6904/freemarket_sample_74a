class AddBuy < ActiveRecord::Migration[5.2]
  def change
    remove_columns :items, :buyer_id, :seller_id
  end
end

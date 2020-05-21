class Add < ActiveRecord::Migration[5.2]
  def change
    remove_columns :items, :seller_id
  end
end

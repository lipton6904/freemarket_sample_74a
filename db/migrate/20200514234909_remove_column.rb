class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_columns :users, :birth_year, :birth_month
  end
end

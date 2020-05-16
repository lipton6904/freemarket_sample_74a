class AncestryData < ActiveRecord::Migration[5.2]
  def change
    change_colum :categories, :ancestry, :string
  end
end

class ChangePlofileToProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_table :plofiles, :profiles
  end
end

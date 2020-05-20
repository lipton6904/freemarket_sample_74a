class RemoveCredit < ActiveRecord::Migration[5.2]
  def change
    remove_columns :credit_cards, :number, :effectivedate_year, :effectivedate_month
  end
end

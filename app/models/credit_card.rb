class CreditCard < ApplicationRecord
  belongs_to :user
  belongs_to :plofile, optional: true
end

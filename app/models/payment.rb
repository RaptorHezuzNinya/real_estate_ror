class Payment < ApplicationRecord
  belongs_to :tenant

  validates_presence_of :iban, :amount, :payment_json, :date, :account_holder
end

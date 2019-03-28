class Tenant < ApplicationRecord
    has_many :payments, dependent: :destroy

    validates_presence_of :email, :accountholder, :first_name, :last_name, :iban, :rent, :phone
end

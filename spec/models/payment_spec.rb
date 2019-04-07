require 'rails_helper'

RSpec.describe Payment, type: :model do
	it { should belong_to(:tenant)}
	it { should validate_presence_of(:iban)}
	it { should validate_presence_of(:amount)}
	it { should validate_presence_of(:account_holder)}
	it { should validate_presence_of(:payment_json)}
	it { should validate_presence_of(:date)}
end

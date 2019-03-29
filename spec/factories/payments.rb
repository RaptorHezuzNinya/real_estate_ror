FactoryBot.define do
    factory :todo do
		iban { Faker::Lorem.word }
        amount { Faker::Number.between(1.00, 500) }
        payment_json { Faker::Json.shallow_json(width = 3, options = { key: 'Name.first_name', value: 'Name.first_name' }) }
        date { Faker::Date.forward(days = 365) }
    end
  end
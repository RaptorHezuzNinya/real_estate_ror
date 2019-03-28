
FactoryBot.define do
    factory :todo do
		email { Faker::Lorem.word }
		accountholder { Faker::Lorem.word }
		first_name { Faker::Lorem.word }
		last_name { Faker::Lorem.word }
		iban { Faker::Lorem.word }
		rent { Faker::Number.between(1.00, 1000) }
		phone { Faker::Lorem.word }
		
    end
  end

class CreateTenants < ActiveRecord::Migration[5.2]
	def change
		create_table :tenants do |t|
			t.string :email
			t.string :accountholder
			t.string :first_name
			t.string :last_name
			t.string :iban
			t.float :rent
			t.string :phone
			t.timestamps
		end
	end
end

class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :iban
      t.float :amount
      t.string :account_holder
      t.json :payment_json
      t.date :date
      t.references :tenant, foreign_key: true

      t.timestamps
    end
  end
end

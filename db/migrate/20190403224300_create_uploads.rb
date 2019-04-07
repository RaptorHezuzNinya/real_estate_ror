class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.json :data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

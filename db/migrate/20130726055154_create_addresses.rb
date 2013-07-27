class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :public_phone
      t.string :public_email
      t.string :public_url
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
  end
end

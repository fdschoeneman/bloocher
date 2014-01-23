class CreateAddressesAddressables < ActiveRecord::Migration
  def change
    create_table :addresses_addressables do |t|
      t.integer :address_id
      t.integer :addressable_id
      t.string :addressable_type
      t.boolean :shipping
      t.boolean :primary

      t.timestamps
    end
  end
end

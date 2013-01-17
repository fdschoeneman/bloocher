class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :name
      t.string :subdomain
      t.string :web_address
      t.string :public_email
      t.string :phone

      t.timestamps
    end

    add_index :producers, :name
    add_index :producers, :subdomain
    add_index :producers, :city
    add_index :producers, :state
    


  end
end

class RemoveColumnsFromProducer < ActiveRecord::Migration
  def change
    remove_column :producers, :address_1, :string
    remove_column :producers, :address_2, :string
    remove_column :producers, :city, :string
    remove_column :producers, :state, :string
    remove_column :producers, :zip, :string
    remove_column :producers, :subdomain, :string
    remove_column :producers, :web_address, :string
    remove_column :producers, :phone, :string
    remove_column :producers, :public_email, :string

  end
end

class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phone, :string
    remove_column :users, :address_1, :string
    remove_column :users, :address_2, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zip, :string
    remove_column :users, :website, :string
  end
end

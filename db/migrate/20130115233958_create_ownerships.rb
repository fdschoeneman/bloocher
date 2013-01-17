class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :owner_id
      t.integer :producer_id

      t.timestamps
    end

    add_index :ownerships, :owner_id
    add_index :ownerships, :producer_id
    add_index :ownerships, [:owner_id, :producer_id], unique: true
  end
end

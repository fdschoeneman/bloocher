class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :accountable_id
      t.string :accountable_type
      t.string :subdomain

      t.timestamps
    end

    add_index :accounts, :subdomain, 														unique: true
    add_index :accounts, :accountable_id, 											unique: true
    add_index :accounts, :accountable_type, 										unique: true
    add_index :accounts, [:accountable_type, :accountable_id],	unique: true
  end
end

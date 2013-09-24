class CreateAccountsActivations < ActiveRecord::Migration
  def change
    create_table :accounts_activations do |t|
      t.integer :account_id
      t.integer :activation_id

      t.timestamps
    end
  end
end

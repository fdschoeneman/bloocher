class CreateAccountsAdmins < ActiveRecord::Migration
  def change
    create_table :accounts_admins do |t|
      t.integer :admin_id
      t.integer :account_id

      t.timestamps
    end
  end
end

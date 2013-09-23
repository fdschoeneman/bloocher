class CreateAccountsAdmins < ActiveRecord::Migration
  def change
    create_table :accounts_admins do |t|
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end

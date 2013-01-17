class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.string :name
      t.integer :producer_id

      t.timestamps
    end

    add_index :wineries, :name, :unique => true
  end
end

class CreateActivations < ActiveRecord::Migration
  def change
    create_table :activations do |t|
      t.integer :activator_id
      

      t.timestamps
    end
  end
end

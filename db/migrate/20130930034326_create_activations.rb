class CreateActivations < ActiveRecord::Migration
  def change
    create_table :activations do |t|
      t.string :credit_card

      t.timestamps
    end
  end
end

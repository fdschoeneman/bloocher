class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.integer :positionable_id
      t.string :positionable_type
      t.string :title

      t.timestamps
    end

    add_index :positions, [:title, :user_id]
  end
end

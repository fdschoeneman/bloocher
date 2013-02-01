class CreateVineyards < ActiveRecord::Migration
  def change
    create_table :vineyards do |t|
      t.integer :producer_id
      t.string :appellation
      t.string :topography
      t.string :soil_composition
      t.string :climate
      t.string :name

      t.timestamps
    end

    add_index :vineyards, :name
    add_index :vineyards, :appellation
  end
end

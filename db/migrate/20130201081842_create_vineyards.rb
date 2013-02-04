class CreateVineyards < ActiveRecord::Migration
  def change
    create_table :vineyards do |t|
      t.integer :producer_id
      t.integer :vineyard_parent_id
      t.string :appellation
      t.string :topo_aspect
      t.integer :topo_slope
      t.integer :topo_elevation
      t.string :soil_composition
      t.string :soil_drainage
      t.integer :soil_depth
      t.integer :soil_fertility
      t.integer :soil_water_capacity
      t.string :climate
      t.string :name
      t.integer :soil_ph
      t.string :rootstock
      t.string :clone
      t.string :nursery
      t.string :varietal
      t.string :irrigation
      t.date :planted_on
      t.date :grafted_on

      t.timestamps
    end

    add_index :vineyards, :name
    add_index :vineyards, :appellation
  end
end
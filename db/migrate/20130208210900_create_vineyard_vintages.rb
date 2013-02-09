class CreateVineyardVintages < ActiveRecord::Migration
  def change
    create_table :vineyard_vintages do |t|
      t.integer :vineyard_id
      t.integer :growing_degree_days
      t.integer :days_above_100
      t.date :bud_break
      t.date :bloom_date
      t.date :veraison
      t.date :last_frost
      t.integer :days_of_frost
      t.integer :days_above_100
      t.decimal :average_yearly_rel_hum

      t.timestamps
    end
  end
end

class CreateWinesFruitLots < ActiveRecord::Migration
  def change
    create_table :wines_fruit_lots do |t|
      t.integer :wine_id
      t.integer :fruit_lot_id
      t.integer :percent_of_wine

      t.timestamps
    end
  end
end

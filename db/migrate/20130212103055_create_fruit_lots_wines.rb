class CreateFruitLotsWines < ActiveRecord::Migration
  def change
    create_table :fruit_lots_wines do |t|
      t.integer :wine_id
      t.integer :fruit_lot_id
      t.integer :percent_of_wine

      t.timestamps
    end
  end
end

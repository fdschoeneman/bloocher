class CreateFruitLots < ActiveRecord::Migration
  def change
    create_table :fruit_lots do |t|
      t.decimal :brix
      t.decimal :weight
      t.date :harvest_date
      t.integer :wine_id
      t.integer :vineyards_vintage_id

      t.timestamps
    end
  end
end

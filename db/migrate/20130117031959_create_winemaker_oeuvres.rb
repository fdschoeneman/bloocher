class CreateWinemakerOeuvres < ActiveRecord::Migration
  def change
    create_table :winemaker_oeuvres do |t|
      t.integer :winemaker_id
      t.integer :wine_id

      t.timestamps
    end

    add_index :winemaker_oeuvres, :wine_id

  end
end

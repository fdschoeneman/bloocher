class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.integer :vintage
      t.integer :cases_produced
      t.text :winemaker_notes
      t.string :name
      t.integer :winery_id

      t.timestamps
    end

    add_index :wines, :vintage
  end
end

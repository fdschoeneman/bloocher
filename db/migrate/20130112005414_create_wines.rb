class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.integer :vintage
      t.integer :cases_produced
      t.integer :days_in_oak
      t.integer :winery_id
      t.boolean :acid_added
      t.datetime :bottled_on
      t.datetime :released_on
      t.string :name
      t.text :winemaker_notes
      t.decimal :ph
      t.decimal :alchohol
      t.decimal :new_french_oak
      t.decimal :one_yr_old_french_oak
      t.decimal :two_yr_old_french_oak
      t.decimal :three_yr_old_french_oak
      t.decimal :new_american_oak
      t.decimal :one_yr_old_american_oak
      t.decimal :two_yr_old_american_oak
      t.decimal :three_yr_old_american_oak

      t.timestamps
    end

    add_index :wines, :vintage
    add_index :wines, :name

  end
end

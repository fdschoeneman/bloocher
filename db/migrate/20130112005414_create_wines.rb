class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.integer :vintage
      t.integer :cases_produced
      t.integer :days_in_oak
      t.integer :winery_id
      t.integer :lay_down_until
      t.integer :drink_before
      t.boolean :acid_added
      t.datetime :bottled_on
      t.datetime :released_on
      t.string :name
      t.text :winemaker_notes
      t.decimal :ph #, precision: 5, scale: 2
      t.decimal :residual_sugar #, precision: 4, scale: 4
      t.decimal :alcohol #, precision: 4, scale:4
      t.decimal :new_french_oak #, precision: 2, scale: 3
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

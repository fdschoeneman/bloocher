class CreateShowcasesWines < ActiveRecord::Migration
  def change
    create_table :showcases_wines do |t|
      t.integer :showcaseable_id
      t.string :showcaseable_type
      t.integer :showcase_id
      t.integer :wine_id
      t.integer :blurb_id

      t.timestamps
    end
  end
end

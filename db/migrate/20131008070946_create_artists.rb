class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|

      t.integer :artist_id
      t.string :statement
      t.string :name

      t.timestamps
    end

    add_index :artists, 								:name

  end
end

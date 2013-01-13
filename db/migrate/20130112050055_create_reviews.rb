class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :reviewer_id
      t.integer :wine_id
      t.text :content

      t.timestamps
    end

    add_index :reviews, :rating
    add_index :reviews, :reviewer_id
    add_index :reviews, :wine_id


  end
end

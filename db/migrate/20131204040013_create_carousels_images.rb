class CreateCarouselsImages < ActiveRecord::Migration
  def change
    create_table :carousels_images do |t|
      t.integer :carousel_id
      t.integer :image_id

      t.timestamps
    end

    add_index :carousels_images, :image_id
    add_index :carousels_images, :carousel_id
    add_index :carousels_images, [:carousel_id, :image_id], unique: true


  end
end

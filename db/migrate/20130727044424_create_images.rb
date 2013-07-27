class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :content_type
      t.integer :imageable_id
      t.string :imageable_type
      t.boolean :active
      t.string :slug

      t.timestamps
    end
  end
end

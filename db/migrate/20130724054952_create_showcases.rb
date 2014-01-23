class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      
      t.integer :sommelier_id
      t.string :version
      t.string :title
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end

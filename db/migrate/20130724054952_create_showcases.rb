class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      
      t.integer :sommelier_id
      t.datetime :version
      t.string :name
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end

class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :carousable_type
      t.integer :carousable_id
      t.integer :image_id

      t.timestamps
    end
  end
end

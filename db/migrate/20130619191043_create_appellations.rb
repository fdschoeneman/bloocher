class CreateAppellations < ActiveRecord::Migration
  def change
    create_table :appellations do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :map

      t.timestamps
    end
  end
end

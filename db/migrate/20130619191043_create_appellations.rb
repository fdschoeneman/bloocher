class CreateAppellations < ActiveRecord::Migration
  def change
    create_table :appellations do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :map

      t.timestamps
    end

    add_index :appellations, [:name, :type], unique: true
  end
end

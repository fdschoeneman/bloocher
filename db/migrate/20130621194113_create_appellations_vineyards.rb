class CreateAppellationsVineyards < ActiveRecord::Migration
  def change
    create_table :appellations_vineyards do |t|
      t.integer :vineyard_id
      t.integer :appellation_id

      t.timestamps
    end

    add_index :appellations_vineyards, [:vineyard_id, :appellation_id], unique: true
  end
end

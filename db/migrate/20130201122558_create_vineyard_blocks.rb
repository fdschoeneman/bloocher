class CreateVineyardBlocks < ActiveRecord::Migration
  def change
    create_table :vineyard_blocks do |t|
      t.integer :vineyard_id
      t.integer :block_id

      t.timestamps
    end

    add_index :vineyard_blocks, :block_id
    add_index :vineyard_blocks, :vineyard_id
    add_index :vineyard_blocks, [:vineyard_id, :block_id], unique: true
  end
end

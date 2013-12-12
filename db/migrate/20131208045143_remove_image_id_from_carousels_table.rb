class RemoveImageIdFromCarouselsTable < ActiveRecord::Migration
  def change
    remove_column :carousels, :image_id, :integer
    add_column :carousels, :name, :string
  end
end

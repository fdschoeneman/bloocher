class AddPositionToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :position, :integer
  end
end

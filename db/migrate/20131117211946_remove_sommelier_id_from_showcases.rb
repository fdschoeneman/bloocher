class RemoveSommelierIdFromShowcases < ActiveRecord::Migration
  def change
    remove_column :showcases, :sommelier_id, :string

  end
end

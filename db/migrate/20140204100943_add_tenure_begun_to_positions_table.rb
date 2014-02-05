class AddTenureBegunToPositionsTable < ActiveRecord::Migration
  def change
    add_column :positions, :tenure_start, :date
    add_column :positions, :tenure_end, :date
  end
end

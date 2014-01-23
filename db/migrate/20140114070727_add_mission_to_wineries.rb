class AddMissionToWineries < ActiveRecord::Migration
  def change
    add_column :wineries, :mission, :text
    add_column :wineries, :history, :text
    add_column :vineyards, :mission, :text
    add_column :vineyards, :history, :text
    add_column :artists, :mission, :text
    add_column :artists, :history, :text
  end
end

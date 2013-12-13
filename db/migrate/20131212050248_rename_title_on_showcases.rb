class RenameTitleOnShowcases < ActiveRecord::Migration
  def change
    rename_column :showcases, :title, :name
  end
end

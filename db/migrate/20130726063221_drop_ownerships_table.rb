class DropOwnershipsTable < ActiveRecord::Migration
  def up

    if table_exists?(:ownerships)
      drop_table(:ownerships)
    end
    drop_table(:settings)
    drop_table(:winemaker_oeuvres)

  end

  def down
    unless table_exists?(:ownerships)
      create_table :ownerships
    end
  end
end

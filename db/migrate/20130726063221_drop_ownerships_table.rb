class DropOwnershipsTable < ActiveRecord::Migration
  def up

    if table_exists?(:ownerships)
      drop_table(:ownerships)
    end

    if table_exists?(:settings)
      drop_table(:settings)
    end

    if table_exists?(:winemaker_oeuvres)
      drop_table(:winemaker_oeuvres)
    end

  end

  def down
    unless table_exists?(:ownerships)
      create_table :ownerships
    end
  end
end

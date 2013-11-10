class AddSlugs < ActiveRecord::Migration
  def change
    add_column :producers,  :slug, :string
    add_index :producers,   :slug, :unique => true
    add_column :artists,    :slug, :string
    add_index :artists,     :slug, :unique => true
    add_column :wineries,   :slug, :string
    add_index :wineries,    :slug, :unique => true
    add_column :showcases,  :slug, :string
    add_index :showcases,   :slug, :unique => true
    add_column :vineyards,  :slug, :string
    add_index :vineyards,   :slug, :unique => true
    add_column :wines,      :slug, :string
    add_index :wines,       :slug, :unique => true
  end
end

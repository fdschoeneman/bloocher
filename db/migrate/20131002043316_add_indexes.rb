class AddIndexes < ActiveRecord::Migration
  def change

  
    add_index :accounts, 									[:activation_id]
		add_index :accounts_activations,  		[:account_id]
		add_index :accounts_activations,  		[:activation_id]
		add_index :addresses,  								[:addressable_id, :addressable_type]
		add_index :accounts_admins, 					[:admin_id]
		add_index :accounts_admins, 					[:account_id]
		add_index :authentications, 					[:user_id]
		add_index :carousels, 								[:carousable_id, :carousable_type]
		add_index :carousels, 								[:image_id]
		add_index :certifications_holdables, 	[:holdable_id, :holdable_type]
		add_index :fruit_lots, 								[:wine_id]
		add_index :fruit_lots, 								[:vineyards_vintage_id]
		add_index :images, 										[:imageable_id, :imageable_type]
		add_index :images, 										[:user_id]
		add_index :positions,									[:positionable_id, :positionable_type]
		add_index :showcases, 								[:sommelier_id]
		add_index :showcases_wines, 					[:showcase_id]
		add_index :showcases_wines, 					[:wine_id]
		add_index :showcases_wines,						[:blurb_id]
		add_index :users, 										[:invited_by_id, :invited_by_type]
		add_index :vineyards, 								[:producer_id]
		add_index :vineyards, 								[:vineyard_parent_id]
		add_index :vineyards_vintages, 				[:vineyard_id]
		add_index :wineries, 									[:producer_id]
		add_index :wines, 										[:winery_id]
		add_index :fruit_lots_wines, 					[:wine_id]
		add_index :fruit_lots_wines, 					[:fruit_lot_id]
  end
end

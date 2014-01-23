class AddShortUrlToWines < ActiveRecord::Migration
  def change
    add_column :wines, :short_url, :string
  end
end

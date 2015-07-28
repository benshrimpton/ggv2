class AddColumnToStoreLocations < ActiveRecord::Migration
  def change
    add_column :store_locations, :body, :text
  end
end

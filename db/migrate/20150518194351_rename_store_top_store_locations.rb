class RenameStoreTopStoreLocations < ActiveRecord::Migration
  def change
    rename_table :stores, :store_locations
  end
end

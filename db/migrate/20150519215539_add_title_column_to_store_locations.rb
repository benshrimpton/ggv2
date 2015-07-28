class AddTitleColumnToStoreLocations < ActiveRecord::Migration
  def change
    add_column :store_locations, :title, :string
  end
end

class AddFeaturedImageToStoreLocation < ActiveRecord::Migration
  def change
    add_attachment :store_locations, :featured_image
  end
end

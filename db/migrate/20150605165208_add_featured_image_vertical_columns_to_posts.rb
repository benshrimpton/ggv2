class AddFeaturedImageVerticalColumnsToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :featured_image_vert
  end
end

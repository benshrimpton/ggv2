class AddColumnsToHomepageImages < ActiveRecord::Migration
  def change
    add_attachment :homepage_images, :featured_image_desktop
    add_attachment :homepage_images, :featured_image_mobile
    add_attachment :homepage_images, :hover_image_1
    add_attachment :homepage_images, :hover_image_2
  end
end

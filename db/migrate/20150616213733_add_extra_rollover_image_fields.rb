class AddExtraRolloverImageFields < ActiveRecord::Migration
  def change
    add_attachment :homepage_images, :hover_image_3
    add_attachment :homepage_images, :hover_image_4
  end
end

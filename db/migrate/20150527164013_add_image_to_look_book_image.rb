class AddImageToLookBookImage < ActiveRecord::Migration
  def change
    add_attachment :lookbook_images, :lookbook_image
  end
end

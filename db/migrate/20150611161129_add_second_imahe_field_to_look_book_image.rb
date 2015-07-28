class AddSecondImaheFieldToLookBookImage < ActiveRecord::Migration
  def change
    add_attachment :lookbook_images, :lookbook_image_1
  end
end

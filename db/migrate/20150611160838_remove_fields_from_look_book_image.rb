class RemoveFieldsFromLookBookImage < ActiveRecord::Migration
  def change
    remove_attachment :lookbook_images, :featured_image_1
  end
end

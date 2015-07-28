class AddFieldsToLookBookImage < ActiveRecord::Migration
  def change
    add_attachment :lookbook_images, :featured_image_1
    add_column :lookbook_images, :title_1, :string
  end
end

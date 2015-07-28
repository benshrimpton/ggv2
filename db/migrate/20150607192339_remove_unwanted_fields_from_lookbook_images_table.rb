class RemoveUnwantedFieldsFromLookbookImagesTable < ActiveRecord::Migration
  def change
    remove_column :lookbook_images, :position
    remove_column :lookbook_images, :integer
    remove_column :lookbook_images, :collections_id
  end
end

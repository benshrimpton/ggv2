class AddLookbookImagesRefToCollection < ActiveRecord::Migration
  def change
    add_reference :lookbook_images, :collections, index: true
  end
end

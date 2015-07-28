class RemoveLookBookIdFromLookBookImages < ActiveRecord::Migration
  def change
    remove_column :lookbook_images, :lookbook_id
  end
end

class AddForeignKeyToLookBookImages < ActiveRecord::Migration
  def change
    add_column :lookbook_images, :collection_id, :integer
  end
end

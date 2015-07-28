class AddColumnsToLookbookImages < ActiveRecord::Migration
  def change
    add_column :lookbook_images, :product_id, :string
    add_column :lookbook_images, :product_id_1, :string
  end
end

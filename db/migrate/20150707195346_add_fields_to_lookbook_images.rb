class AddFieldsToLookbookImages < ActiveRecord::Migration
  def change
    add_column :lookbook_images, :gemgento_product_id, :string
    add_column :lookbook_images, :gemgento_product_id_1, :string
  end
end

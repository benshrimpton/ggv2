class AddFieldsToLookbookProducts < ActiveRecord::Migration
  def change
    add_reference :lookbook_products, :collection, index: true
    add_column :lookbook_products, :product_title, :string
    add_column :lookbook_products, :product_image_url, :string
    add_column :lookbook_products, :product_url, :string
  end
end

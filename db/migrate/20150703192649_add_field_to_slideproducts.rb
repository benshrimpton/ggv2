class AddFieldToSlideproducts < ActiveRecord::Migration
  def change
    add_reference :slideproducts, :collection, index: true
    add_column :slideproducts, :product_title, :string
    add_column :slideproducts, :product_image_url, :string
    add_column :slideproducts, :product_url, :string
  end
end

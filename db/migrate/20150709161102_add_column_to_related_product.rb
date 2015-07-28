class AddColumnToRelatedProduct < ActiveRecord::Migration
  def change
    add_column :related_products, :product_id, :integer
  end
end

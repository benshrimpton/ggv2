class ChangeColumnNameAndTypeInRealtedProducts < ActiveRecord::Migration
  def change
    rename_column :related_products, :product_id, :product_sku
    change_column :related_products, :product_sku, :string
  end
end

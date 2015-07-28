class AddGoogleProductCategoryToGemgentoCategories < ActiveRecord::Migration
  def change
    add_column :gemgento_categories, :google_product_category, :string
  end
end

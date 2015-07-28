module GoogleProductFeedsHelper

  def product_image(product)
    if product.is_catalog_visible? && !product.assets.empty?
      product.assets.first.image.url(:product)
    else
      configurable_product = product.configurable_products.first
      if !configurable_product.nil? && !configurable_product.assets.empty?
        configurable_product.assets.first.image.url(:product)
      end
    end
  end

  def availability(product)
    product.in_stock? ? 'in stock' : 'out of stock'
  end

  def item_group_id(product)
    if product.is_catalog_visible?
      product.sku
    else
      product.configurable_products.first.sku
    end
  end

end
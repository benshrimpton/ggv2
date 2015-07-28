Gemgento::ProductsHelper.module_eval do

  # Get ordered simple products based on the different size attributes available.
  #
  # @return [Array(Gemgento::Product)]
  def simple_products
    simple_products = {}
    %w(denim jacket knits leather overcoats coats ties t_shirts scarves shirts size).each do |size_attr|
      next unless @product.configurable_attribute_order.has_key?(size_attr)

      @product.configurable_attribute_order[size_attr].each do |size, product_ids|
        next if size.blank?
        simple_products[size] = Gemgento::Product.find(product_ids.first)
      end
    end

    return simple_products
  end

end
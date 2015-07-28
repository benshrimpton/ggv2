Gemgento::ProductsController.class_eval do

    def show
      @product = Gemgento::Product.active.catalog_visible.find(params[:id])
      @current_category = @product.current_category(session[:category])

      if @product.related_products.any?
        related_product_skus = @product.related_products.first.related_product_sku.split(',')
        @related_products = Gemgento::Product.active.catalog_visible.where(sku: related_product_skus)
      end
    end

end
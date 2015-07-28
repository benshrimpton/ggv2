Gemgento::CategoriesController.class_eval do

  def show
    @current_category = Gemgento::Category.active.navigation.find_by!('id = ? OR url_key = ?', params[:id], params[:id])
    @products = current_category.products.active.catalog_visible
    @products = @products.page(params[:page]).per(6) unless params[:show_all]
  end

end
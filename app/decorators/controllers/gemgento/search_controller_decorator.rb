Gemgento::SearchController.class_eval do

  def index
    @query = params[:query]
    Gemgento::Product.unscoped do
      @products = Kaminari.paginate_array(Gemgento::Search.products(@query)).page(params[:product_page] || 1).per(12)
    end
  end
end
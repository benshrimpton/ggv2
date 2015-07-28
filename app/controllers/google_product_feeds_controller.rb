class GoogleProductFeedsController < ApplicationController
  layout false

  respond_to :xml

  def show
    @categories = Gemgento::Category.top_level.navigation
    @products = Gemgento::Product.active.catalog_visible.where('sku NOT LIKE ?', '%_sale')
  end

end

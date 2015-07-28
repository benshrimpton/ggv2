class PagesController < ApplicationController
  caches_page :splash

  def index
    
  end

  def show
    @page = Page.find_by!(url_key: params[:url_key])
  end

  def splash
    render layout: false
  end

  def mini_bag
    render partial: 'shared/mini_cart'
  end

  def order_thank_you
    render 'pages/order_thank_you'
  end  
  

  def home
    
    @cover_image = CoverImage.first
    @shop_image = HomepageImage.find_by(menu_name: 'shop')
    @collections_image = HomepageImage.find_by(menu_name: 'collections')
    @journal_image = HomepageImage.find_by(menu_name: 'journal')
    @store_image = HomepageImage.find_by(menu_name: 'store')
    @account_image = HomepageImage.find_by(menu_name: 'account')
    render template: 'pages/home',layout: "home"
  end

end
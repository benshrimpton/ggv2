class SkynetController < ApplicationController 
  
  
  layout "skynet/layouts/skynet"


  def index
    @products = Gemgento::Product.all
    @products = @products.page(params[:page]).per(5)
  end  

  def products
    @products = Gemgento::Product.all
    @products = @products.page(params[:page]).per(30)
  end

  def product
    @product = Gemgento::Product.find(params[:id])
  end

  def settings
    @setting = Setting.first
    #render 'skynet/settings'
  end 

  def lookbooks
    @lookbooks = Collection.all
  end 
  def lookbook
     @lookbook= Collection.find(params[:id])
  end 
  def gallery
     @lookbook= Collection.find(params[:id])
  end 
  def stores
    @stores = StoreLocation.all
  end

  def pages
    @pages = Page.all
  end
  def page
    @page = Page.find(params[:id])
  end

  def categories
    @categories = Gemgento::Category.all
  end

  def category
    @category = Gemgento::Category.find(params[:id])
    @products = @category.products.active.all
    @products = @products.all
  end 


end


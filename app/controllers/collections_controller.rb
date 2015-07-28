class CollectionsController < ApplicationController 
  
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find_by(url_key: params[:url_key])
  end

  def video
    @collection = Collection.find_by(url_key: params[:url_key])
  end 

end

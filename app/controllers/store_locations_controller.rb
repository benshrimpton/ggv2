class StoreLocationsController < ApplicationController

  def index
    @stores = StoreLocation.all
    @flagship = StoreLocation.first
  end

end  
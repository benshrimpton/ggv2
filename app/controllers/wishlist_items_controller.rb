class WishlistItemsController < ApplicationController
  #before_filter :set_redirect_url
  before_filter :authenticate_user!

  def index
    @wishlist_items = current_user.wishlist_items
  end

  def create
    wishlist_item = current_user.wishlist_items.create(product_id: params[:product_id])

    if wishlist_item.save
      redirect_to "/user/wishlist", notice: "Items successfully saved"
    else
      render 'index', notice: "We were unable to save this item."
    end
  end

  def destroy
    wishlist_item = WishlistItem.find_by(user_id: current_user.id, product_id: params[:id])
    wishlist_item.destroy!
    redirect_to "/user/wishlist" , notice: "Item removed."
  end
end
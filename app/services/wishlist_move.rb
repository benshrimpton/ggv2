class WishlistMove

  def cart_to_wishlist
    WishlistMove.cart_to_wishlist(line_item, current_user)
  end
  def wishlist_to_cart
    WishlistMove.wishlist_to_cart(wishlist_item, current_quote)
  end

end

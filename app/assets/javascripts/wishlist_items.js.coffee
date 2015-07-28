window.App ||= {}
class App.GemgentoUserWishlistItems extends App.Base

  beforeAction: (action) =>
    return


  afterAction: (action) =>
    return


  foo: =>
    $(".add-to-bag-button").on "click", ->
      alert "ss"
      $(this).text("ADDED TO BAG").addClass("added-to-bag")
      itemIndex = $(this).data("item-index")
      pid = $(this).data("product-id")
      qty = $("#wishlist-item-#{itemIndex}").find(".qty select").val()

      #add to bag
      App.addToCart pid, qty, (r) ->
        if r.result
          App.refeshBag()
          App.mainMenu.openShoppingBag()
        else
          alert "something went wrong"

    $(".cart-item-container #size").on "change", ->
      newPid = $(this).val()
      itemIndex = $(this).data("item-index")
      addToBagBtn = $("#wishlist-item-#{itemIndex}").find(".add-to-bag-button")
      if addToBagBtn
        addToBagBtn.data("product-id", newPid)

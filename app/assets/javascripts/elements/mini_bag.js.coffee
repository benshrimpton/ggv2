window.Element ||= {}
class Element.MiniBag
  isOpen: false

  constructor: ->
    $(window).on 'resize', @onResize
    @setMiniCartHeight()
    return this

  open: =>
    unless @isOpen
      @setMiniCartHeight()
      $(".bag-icon").addClass 'active'
      @isOpen = true

  close: =>
    if @isOpen
      $(".bag-icon").removeClass 'active'
      @isOpen = true

  refresh: =>
    $.ajax
      url: "/partials/minibag"
      success: (response) ->
        $(".mini-cart-wrapper").replaceWith(response)
        $(window).trigger "resize"
        App.miniBag.open()

  removeItem: (event) =>
    event.preventDefault()
    result = App.remoteSubmission $(event.target)
    result.done (responnse) ->
      App.reloadAndOpenFixedHeader()

  updateItem: (event) =>
    event.preventDefault()
    result = App.remoteSubmission $(event.target).parent()
    result.done (response) ->
      App.reloadAndOpenFixedHeader()
    result.fail (response) ->
      alert("Sorry. The Requested quantity is not avalable.")

  onResize: =>
    App.miniBag.setMiniCartHeight()

  setMiniCartHeight: ->
    if $('.mini-cart-item').length > 0
      $('.mini-cart-inner').niceScroll cursorcolor: "#ddd"
      $('.mini-cart-wrapper').css 'height', $('.mini-cart-item').length*200+80
    return
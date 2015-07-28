window.App ||= {}
class App.GemgentoCheckoutConfirm extends App.Base

  constructor: ->
    super
    return this

  index: =>


  show: =>
    $('.place-order').on 'click', ->
      $(this).attr 'disabled', 'disabled'
      $('.edit_quote').submit()
      return 

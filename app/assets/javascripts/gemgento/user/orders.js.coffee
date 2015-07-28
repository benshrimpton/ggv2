window.App ||= {}
class App.GemgentoUserOrders extends App.Base

  constructor: ->
    super
    this

  index: =>

    $('.order-ajax').on 'click' , (e) ->
      e.preventDefault()
      $('#ajax-order-target').prepend('<div id="ajax-loader"></div>')
      url = $(this).attr('href')
      history.pushState({}, '', url);
      target = $('#ajax-order-target')
      target.load url+' #checkout', ->
        $('#ajax-loader').remove()
        $(document.body).animate 'scrollTop': $('#checkout').offset().top - 200, 600, 'swing'


  show: =>

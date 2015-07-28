window.App ||= {}
class App.GemgentoUserAddresses extends App.Base

  constructor: ->
    super
    this


  index: =>

    $('.add-address-link').on 'click' , (e) ->
      e.preventDefault()
      $('#ajax-address-target').prepend('<div id="ajax-loader"></div>')
      url = $(this).attr('href')
      history.pushState({}, '', url);
      target = $('#ajax-address-target')
      target.load url+' #new-address', ->
        $('#ajax-loader').remove()



  show: =>

window.App ||= {}
class App.GemgentoUserHome extends App.Base

  constructor: ->
    super
    this


  index: =>

    $('.change-password-link').on 'click' , (e) ->
      e.preventDefault()
      $('.ajax-content').prepend('<div id="ajax-loader"></div>')
      url = $(this).attr('href')
      history.pushState({}, '', url);
      target =   $('.ajax-content')
      target.load url+' #new-password', ->
        $('#ajax-loader').remove()



  show: =>

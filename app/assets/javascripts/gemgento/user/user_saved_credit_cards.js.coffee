window.App ||= {}
class App.GemgentoUserSavedCreditCards extends App.Base

  constructor: ->
    super
    this


  index: =>

    $('.add-cc-link').on 'click' , (e) ->
      e.preventDefault()
      $('#ajax-form-target').prepend('<div id="ajax-loader"></div>')
      url = $(this).attr('href')
      history.pushState({}, '', url);
      target = $('#ajax-form-target')
      target.load url+' #new-cc-form', ->
        $('#ajax-loader').remove()



  show: =>

window.Element ||= {}
class Element.Subscribe
  submitting: false

  constructor: ->
    $('#subscribe-trigger').on 'click', @open
    $('.subscribe-modal-close').on 'click', @close
    $('#subscribe-modal').on 'click', @checkClose
    $('#new_subscriber').submit @submit
    $('.subscribe-email').on 'change', ->
      $('.subscribe-email').removeClass 'error-field'
    return this

  open: (event) =>
    event.preventDefault()
    $('#subscribe-modal').toggleClass 'open'

  checkClose: (e) =>
    container = $(".subscribe-modal-inner")
    if (!container.is(e.target) && container.has(e.target).length == 0)     
        App.subscribe.close()
    
  close: (event) =>
    if event != undefined 
      event.preventDefault()
    $('#subscribe-modal').toggleClass 'open'

  submit: (e) =>    
    $('.subscribe-fail').removeClass 'error-field'
    e.preventDefault()
    return if Element.Subscribe.submitting
    Element.Subscribe.submitting = true
    
    $.ajax
      url: $("#new_subscriber").attr('action')
      type: $("#new_subscriber").attr('method')
      data: $("#new_subscriber").serialize()
      dataType: 'json'
      success: (response) ->
        if response.errors
          $('.subscribe-fail').addClass 'error-field'
          $('.error-field').text(response.errors[0])


        if response.subscriber
          $('.subscribe-modal-notice').text 'Thank you for subscribing.'
        Element.Subscribe.submitting = false
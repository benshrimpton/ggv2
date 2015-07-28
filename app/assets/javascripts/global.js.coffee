window.App ||= {}

App.setGlobalEventHandlers = ->
  
  App.transitions = new Element.Transitions()
  App.subscribe = new Element.Subscribe()
  App.miniBag = new Element.MiniBag()


  $('.mobile-sidebar-select').on 'change', ->
    theUrl = $(this).find('option:selected').data('url')
    Turbolinks.visit theUrl
    return

  # // we must rmeove this hidden class on every page load.
  # // $('.main-header, #main-footer').removeClass 'home-fixed'

  $('.site-credit').on 'mouseenter', ->
    $('.site-credit').html 'Maui New York'
  $('.site-credit').on 'mouseleave', ->
    $('.site-credit').html 'SITE CREDIT'

  $(document).on 'submit', '.splash-subscribe-form form', (e) ->
    e.preventDefault()
    $('#success').empty().fadeOut()
    $.ajax
      url: $('form').attr('action')
      type: $('form').attr('method')
      data: $('form').serialize()
      dataType: 'json'
      success: (response) ->
        if response.errors
          $('#success').empty().fadeIn().text response.errors[0]
        else
          $('#success').empty().fadeIn().text 'Thank you for subscribing'

  $('.main-nav li.has-children .top-menu').on 'click', (e) ->
    splashImage = $('.swap-image').offset()
    theFooter = $('#main-footer').offset()

    searchWrap = $('.search-wrapper')
    mainHeader = $('.main-header')
    allChildUl = $('.main-nav ul')
    currentTop = $('.swap-image').css 'top'

    if ($(this).siblings().hasClass('shown') && $(window).width() > 768) 
      imgHeight = $('.swap-image').height()
      allChildUl.removeClass 'shown'
      mainHeader.addClass('hovered').height 145



      $('.swap-image').removeClass 'pushed'
      $('.swap-image').css 'top': $(window).height() / 2 - (imgHeight / 2)
      $('#main-footer').css
        'transform': 'translateY(0)'
        '-webkit-transform': 'translateY(0)'




      #// $('#main-footer').css 'opacity': '1'
      #//console.log currentTop
    else
      thisUl = $(this).siblings("ul")
      ulHeight = thisUl.outerHeight()
      newHeight = 173 + ulHeight
      #//pushDownImage = ulHeight - 130
      mainHeader.addClass('hovered').height newHeight
      $('.main-nav li.has-children').removeClass 'shown'
      allChildUl.removeClass 'shown'
      $(this).siblings().addClass 'shown'
      thisUl.addClass 'shown'
      
      $('.swap-image').addClass 'pushed'
      #//$('.swap-image').css 'top': pushDownImage+'px'
      $('.swap-image').css 'top': '200px'
      $('#main-footer').css
        'transform': 'translateY(200px)'
        '-webkit-transform': 'translateY(200px)' 


      #//$('#main-footer').css 'opacity': '0'
      if searchWrap.hasClass('shown')
        searchWrap.removeClass 'shown'
      return

  # //for some reason mobile wont respect click, use touchstart instead
  # //non Touch enabled browsers will ignore the event handler
  $(document).on 'touchstart', '.toggle-nav', ->
    navheight = $(window).height() - 100
    $(this).toggleClass 'active'
    $('#nav').height navheight
    $('#nav').toggleClass 'shown'
    $('#nav li.has-children:first-of-type > span').addClass 'open'
    return

  $(document).on 'mousedown', '.toggle-nav', ->
    console.log  "toggle mobile nav"
    navheight = $(window).height() - 100
    $(this).toggleClass 'active'
    $('#nav').height navheight
    $('#nav').toggleClass 'shown'
    $('#nav li.has-children:first-of-type > span').addClass 'open'
    return


  $(document).on 'click', '.nav > ul > li', ->
    $('.nav li span.open').removeClass 'open'
    return
  $(document).on 'click', '#search-icon', ->
    $('.nav li span.open').removeClass 'open'
    return

  $(document).on 'click', '#search-icon', ->
    $('.main-nav ul').removeClass("shown")
    unless $('.search-wrapper').hasClass 'shown'
      $('.search-wrapper').toggleClass 'shown'
      #this focus doesnt work?
      $('.search-wrapper input.search-field').focus()
    return

  $(window).smartresize ->
    if $('.main-header').hasClass('hovered')
      $('.main-header').removeClass('hovered').removeAttr 'style'
      $('.main-header ul').removeClass 'shown'
      $('#main-footer').css
        'transform': 'translateY(0)'
        '-webkit-transform': 'translateY(0)'
    return
    
  $(window).on 'scroll', ->
    if !Modernizr.touch
      mainHeight = $('.main').height()
      scroll = $(window).scrollTop()
      searchWrap = $('.search-wrapper')
      if mainHeight > 1000
        if scroll > 10
          if searchWrap.hasClass('shown')
            searchWrap.removeClass 'shown'
          $('body').addClass 'scrolled'
        else
          $('body').removeClass 'scrolled'
    return

  resizeProductSlider = ->
    slider = $('#product-image-gallery')
    sliderWidth = $('.product-images').width()
    sliderHeight = sliderWidth * 1.16
    if $(window).width() < 991
      slider.width(sliderWidth).height sliderHeight + 100
    else
      slider.width(sliderWidth - 70).height sliderHeight
    return
  resizeProductSlider()

  goRoyal = ->
    if $('#product-image-gallery').length
      resizeProductSlider()
      thumbs = undefined
      if Modernizr.touch
        thumbs = 'none'
      else
        thumbs = 'thumbnails'
      $('#product-image-gallery').royalSlider
        arrowsNav: true
        addActiveClass: true
        navigateByCenterClick: false
        loopRewind: true
        #autoHeight: true
        imageScalePadding: false
        slidesSpacing: 0
        imageScalePadding: 0
        imageScaleMode: 'fit'
        controlNavigation: 'none'
        transitionSpeed: 600
        deeplinking:
          enabled: true
          prefix: 'image-'
          change: true
        keyboardNavEnabled: true
      sliderData = $('#product-image-gallery').data('royalSlider')
      sliderData.ev.on 'rsAfterSlideChange', ->
        return
    return
  goRoyal()

  $(document).on 'mouseup', '#zoom-trigger', (e) ->
    e.preventDefault()
    zoomData = $('.rsSlide.rsActiveSlide .slide').data('image-zoom')
    $('body').css 'overflow':'hidden'
    $('#zoom-wrapper').addClass 'shown'
    $('#zoom-wrapper img').attr 'src', zoomData
    $('#zoom-wrapper').imagesLoaded ->
      $('#zoom-wrapper img').css 'opacity': '1'
      return
    return

  $(document).on 'click', '#zoom-wrapper, .zoom-wrapper-close ', (e) ->
    $('body').removeAttr 'style'
    $('#zoom-wrapper').toggleClass 'shown'
    $('#zoom-wrapper img').removeAttr 'style'
    return

  $(window).on 'resize', ->
    resizeProductSlider()
    return

  $('img.lazy').unveil 600, ->
    $(this).load ->
      @style.opacity = 1
      #$('.save-for-later').css "opacity", "1"
      return
    return
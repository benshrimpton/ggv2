window.App ||= {}
class App.Posts extends App.Base

  index: =>
    

  show: =>  
    setJournalSliderHeight = ->
      slideWidth = $('#journal-slidehow').outerWidth()
      slideHeight = slideWidth / 1.5
      $('#journal-slidehow').animate { 'height': slideHeight + 'px' }, 100, ->
        doLookbook()
        return

    doLookbook = ->
      dasSlider =  $('#journal-slidehow')
      dasSlider.royalSlider
        controlNavigation: 'none'
        loop: false
        imageScaleMode: 'fit'
        navigateByClick: true
        numImagesToPreload: 2
        arrowsNav: true
        arrowsNavAutoHide: false
        arrowsNavHideOnTouch: false
        keyboardNavEnabled: true
        fadeinLoadedSlide: true
        globalCaption: false
        globalCaptionInside: false
        autoHeight: true
        transitionSpeed: 300
        addActiveClass: true
        slidesSpacing: 0
        imageScalePadding : 0 

      slider = dasSlider
      sliderInstance = slider.data('royalSlider')
      slider.prepend slider.find('.rsArrowLeft, .rsArrowRight')
      return
    
    #call it on page load
    setJournalSliderHeight() 

    $(window).on 'resize', ->
      setJournalSliderHeight()




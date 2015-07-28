window.App ||= {}
class App.Collections extends App.Base

  index: =>

  show: =>
    @lookbookProductFilter()
    doLookbook = ->
      dasSlider = $('#look-book')
      dasSlider.imagesLoaded ->
        dasSlider.css "opacity", "1"
        dasSlider.royalSlider
          controlNavigation: 'none'
          loop: false
          imageScaleMode: 'fit'
          navigateByClick: true
          numImagesToPreload: 2
          arrowsNav: true
          arrowsNavAutoHide: false
          navigateByClick: false
          keyboardNavEnabled: true
          fadeinLoadedSlide: true
          globalCaption: false
          globalCaptionInside: false
          autoHeight: true
          transitionSpeed: 300
          addActiveClass: true
        slider = dasSlider
        sliderInstance = slider.data('royalSlider')
        slider.prepend slider.find('.rsArrowLeft, .rsArrowRight')
        sliderInstance.ev.on 'rsAfterContentSet', ->
          console.log 'rs set'

        updCount = ->

        logIt = ->
          console.log 'Started'
          return

        sliderInstance.ev.on 'rsAfterSlideChange', updCount
        sliderInstance.ev.on 'rsAfterContentSet', logIt
        return
      return
    doLookbook()     


  video: =>

    $(".collection-video-wrap").fitVids()



  lookbookProductFilter: ->
    $(document).on "mouseup", ".look-book-slide-wrap", (event) =>

      $this = $(event.currentTarget);

      dataRef = $(event.currentTarget).attr("data-ref")
      relatedSet = $(".look-book-slide").find('.slide-products#'+dataRef);
      
      $('.look-book-slide-wrap').removeClass 'active'
      $('.slide-products').hide()

      $this.addClass 'active'
      relatedSet.toggle()


     

     

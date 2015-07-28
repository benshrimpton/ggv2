# app/assets/javascripts/store_locations.js.coffee
window.App ||= {}
class App.StoreLocations extends App.Base

   index: =>

      $('.featured-image').imagesLoaded ->
          $('.featured-image img').css "opacity", "1"
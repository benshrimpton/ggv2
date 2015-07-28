window.App ||= {}
class App.GemgentoCategories extends App.Base

  constructor: ->
    super
    this
    $(document).ready @setSelectBoxValue

  show: =>

  setSelectBoxValue: =>
    if $(window).width() < 768
      currentCategory = $('.current-category').text()
      $('.mobile-sidebar-select').val(currentCategory)

          


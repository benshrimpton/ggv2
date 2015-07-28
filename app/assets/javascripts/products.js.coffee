window.App ||= {}
class App.GemgentoProducts extends App.Base

  show: =>
    @hijackQtySelect()
    @hijackSizeSelect() if $('select#line_item_product_id').length > 0
    $('#qty-list li').on 'click', @selectQty
    $('#size-list li').not('.disabled').on 'click', @selectSize
    $('.select-hijack-wrap .heading').on 'click', @openSelect
    $('.select-hijack-wrap ul').on 'mouseleave', @closeSelect
    $('#product-share').on "click", @toggleShare
    $("#new_line_item").on 'submit', @addToCart

    return


  addToCart: (event) ->
    event.preventDefault()

    $("#form-errors").hide().text("") # reset errors

    if $("#line_item_product_id").val() == ""
      $("#form-errors").show().text("please select a size")

    else if  $("#line_item_qty_ordered").val() == undefined || $("#line_item_qty_ordered").val() == ""
      $("#form-errors").show().text("please select a quantity")

    else if !$(event.currentTarget).find("input[type=submit]").hasClass("added-to-bag")
      $(".add-to-cart").addClass("adding").attr('disabled', 'disabled').val(" ")

      response = App.remoteSubmission $(event.currentTarget)

      response.done (data, textStatus, jqXHR) ->
        $(".add-to-cart").val("ADDED TO BAG")
        $(".add-to-cart").addClass("added-to-bag").removeClass('adding').removeAttr('disabled')
        App.miniBag.refresh()
        setTimeout App.miniBag.close, 3000
        return

      response.fail ( jqXHR, textStatus, errorThrown) ->
        data = jqXHR.responseJSON
        $("#form-errors").show().text(data.errors.join('<br/>'))
        $('.add-to-cart').val('ADD TO BAG')
        $('.add-to-cart').removeClass('adding').removeAttr('disabled')
        return


  hijackQtySelect: =>
    $('.hijack-wrap').append '<div class=\'select-hijack-wrap\'><span class=\'heading\'>Qty <span id=\'select-hijack-qty-total\' class=\'hijack-total\'>1</span></span><ul class=\'size-list \'id=\'qty-list\' /></div>'

    $('#line_item_qty_ordered option').each ->
      newVal = $(this).text().trim()
      newDataVal = $(this).val()
      $('#qty-list').append '<li data-val="' + newDataVal + '">' + newVal + '</li>'
      return

    return

  hijackSizeSelect: =>
    $('.hijack-wrap').append '<div class=\'select-hijack-wrap\'><span class=\'heading\'>Select Size<span id=\'select-hijack-size-total\' class=\'hijack-total\'></span></span><ul class=\'size-list \'id=\'size-list\' /></div>'

    $('#line_item_product_id option').each ->
      newVal = $(this).text().trim()
      newDataVal = $(this).val()
      out = $(this).attr('disabled')
      if out == 'disabled'
        $('#size-list').append '<li data-val="' + newDataVal + '" class="disabled">' + newVal + ' out of stock</li>'
      else
        $('#size-list').append '<li data-val="' + newDataVal + '" class="in-stock">' + newVal + '</li>'

      $('#size-list').find('li:empty').remove()
      return

    return


  selectQty: (event) ->
    event.preventDefault()
    val = $(this).data('val')
    count = $('#select-hijack-qty-total')
    count.text val
    $('#line_item_qty_ordered').val(val).trigger 'change'
    $('#qty-list li').removeClass 'active'
    $(this).addClass 'active'
    $(this).parent().toggleClass 'open'
    return


  selectSize: (event) ->
    event.preventDefault()
    val = $(this).data('val')
    count = $('#select-hijack-size-total')
    count.text $(this).text()
    $('#line_item_product_id').val(val).trigger 'change'
    $('#size-list li').removeClass 'active'
    $(this).addClass 'active'
    $(this).parent().toggleClass 'open'
    return


  openSelect: (event) ->
    $('.select-hijack-wrap ul').removeClass 'open'
    $(this).next().toggleClass 'open'
    return


  closeSelect: (event) ->
    $(this).removeClass('open') if $(this).hasClass('open')
    return


  toggleShare: (event) =>
    event.preventDefault()
    $('#social-share-wrap').toggleClass 'shown'
    return
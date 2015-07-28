window.App ||= {}
class App.GemgentoCheckoutAddress extends App.Base

  beforeAction: =>
    $('#saved-addresses-shipping, #saved-addresses-billing').on 'change', @selectSavedAddress
    $('#checkout-addresses-form').on 'submit', @formDataValidation
    $(".toggle-address-form").on 'click' , @toggleAddressForm
    $('#quote_same_as_shipping').on 'click', @toggleBillingAddress
    $('#quote_shipping_address_attributes_country_id').on 'change', @togglePostcodeLabel
    $('#quote_billing_address_attributes_country_id').on 'change', @togglePostcodeLabel
    @dynamicRegionSelection()
    return


  selectSavedAddress: (event) =>
    event.preventDefault()
    $target = $(event.target)
    type = $target.attr('id').split('-').pop()

    if $target.val() != 'Select address'
      address = $target.find('option:selected')
      @setSavedAddress(type, address)
    else
      @clearAddress(type)

    return


  setSavedAddress: (type, address) =>
    # change the rest of the address attributes
    $("#quote_#{type}_address_attributes_first_name").val(address.data('first-name'))
    $("#quote_#{type}_address_attributes_last_name").val(address.data('last-name'))
    $("#quote_#{type}_address_attributes_address1").val(address.data('address1'))
    $("#quote_#{type}_address_attributes_address2").val(address.data('address2'))
    $("#quote_#{type}_address_attributes_city").val(address.data('city'))
    $("#quote_#{type}_address_attributes_region_id").val(address.data('region-id'))
    $("#quote_#{type}_address_attributes_postcode").val(address.data('postcode'))
    $("#quote_#{type}_address_attributes_telephone").val(address.data('telephone'))
    $("#quote_#{type}_address_attributes_country_id").val(address.data('country'))
    return


  clearAddress: (type) =>
    $("#quote_#{type}_address_attributes_first_name").val('')
    $("#quote_#{type}_address_attributes_last_name").val('')
    $("#quote_#{type}_address_attributes_address1").val('')
    $("#quote_#{type}_address_attributes_address2").val('')
    $("#quote_#{type}_address_attributes_city").val('')
    $("#quote_#{type}_address_attributes_postcode").val('')
    $("#quote_#{type}_address_attributes_telephone").val('')
    $("#quote_#{type}_address_attributes_name").val('')
    return


  formDataValidation: (event) =>
    formData = ['first_name', 'last_name', 'address1', 'city', 'region_id', 'postcode', 'telephone']
    i = 0

    while i < formData.length
      if $("#quote_shipping_address_attributes_#{formData[i]}").val() == ""
        $("#quote_shipping_address_attributes_#{formData[i]}").css('border-color', 'red')
        $(".shipping_address_#{formData[i]}").css('color', 'red')
        $(".shipping_address_#{formData[i]}").text("#{formData[i].replace("_", " ")}(please enter #{formData[i].replace("_", " ")})")
        event.preventDefault()
      i++

    return


  toggleBillingAddress: (event) =>
    $target = $(event.target)

    if $target.prop('checked')
      $('#billing-address').hide()
    else
      $('#billing-address').show()

    return


  toggleAddressForm: (event) =>
    event.preventDefault()
    $target = $(event.target)

    if $target.hasClass('open')
      $target.html('<a href="">Add New Address</a>')
    else
      $target.html('<a href="">Cancel</a>')

    $(".address-form-wrapper").slideToggle()
    $target.toggleClass('open')

    return


  dynamicRegionSelection: =>
    for type in ['shipping', 'billing']
      $countrySelector = $("#quote_#{type}_address_attributes_country_id")
      $regionSelector = $("#quote_#{type}_address_attributes_region_id")
      $regionWrapper = $regionSelector.parent()

      App.updateRegions($countrySelector, $regionSelector, $regionWrapper)

    return


  togglePostcodeLabel: (event) =>
    $target = $(event.target)
    type = if /billing/i.test( $target.attr('id') ) then 'billing' else 'shipping'
    $label = $("label[for='quote_#{type}_address_attributes_postcode']")

    if $target.val() == '230'
      $label.html('ZIP')
    else
      $label.html('Post Code')

    return true
$(document).ready(function() {


$(document).on('click', '.cart-item-ate', function(event) {
  event.preventDefault();
  $this = $(this);


  removeBtn = $(this).prev().find('a');
  removeUrl = removeBtn.attr('href');
  console.log(removeUrl)

  console.log(removeBtn);

  var url =  $(this).find('a').attr('href');



  $.ajax({
    url: url,
    method: "POST"
  }).done(
    function(response) {
    console.log( response );
    alert("successfully added to wish list");
    removeBtn[0].click()
  }).fail(
    function (response) {
      console.log(response)
      $this.after('<div id="si-notice">Already In Saved Items</div>');
      setTimeout(fadeItOut, 3000);
    });
});

function fadeItOut () {
  $('#si-notice').fadeOut(200)
}
$(document).on('click','.remove-item', function (e) {
  console.log("remove");
  e.preventDefault();
});

});//end dom


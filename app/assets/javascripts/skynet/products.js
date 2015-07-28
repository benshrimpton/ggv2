var ready;
ready = function() {

  console.log("your dom is ready")
  

  $('#product-list-filter').fastLiveFilter('.product-list');
  $( "#sortable" ).sortable();



  $('.toggle-category').on('click', function (argument) {
   $('#sortable .category-item').each(function(){
    if($(this).hasClass('col-sm-2')){
      $(this).removeClass('col-sm-2').addClass('col-sm-3');
    }
    else {
      $(this).removeClass('col-sm-3').addClass('col-sm-2');
    }
   });
  });



};

$(document).ready(ready);
$(document).on('page:load', ready);



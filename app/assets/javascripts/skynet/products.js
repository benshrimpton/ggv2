var ready;
ready = function() {

  console.log("your dom is ready");

  // lookbook gallery thumbs
  $('#gallery-thumbs img:first-of-type').addClass('selected');
  $('#gallery-thumbs img').on('mousedown', function(){
   $('#gallery-thumbs img').removeClass('selected');
   $(this).addClass('selected');
   var src = $(this).attr('src');
   $('.featured-image').attr('src', src);
  });


  $('.lookbook-video').fitVids();
  $('#product-list-filter').fastLiveFilter('.product-list');
  $( "#sortable, .sortable" ).sortable();
  
  //swap featued image
  $( ".thumbs.sortable" ).sortable({
    stop: function( event, ui ) {
      var src = $( ".thumbs img:first").attr('src');
      var fsrc = $( ".featured-image");
      fsrc.attr('src', src);
    }
  });

  //lookbook video swap source on user input
  $('#video-id').on('change', function(){
    var newId = $(this).val();
    var newSrc = "https://www.youtube.com/embed/"+newId+"/";
    $('.lookbook-video iframe').attr('src', newSrc);
  });

  // Enlarge cat Thumbs
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



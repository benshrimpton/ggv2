// simple plugin to toggle the VALUE attr of a form field
// call like this $('input elelemnt').inputtoggle();
jQuery.fn.inputtoggle = function(){
  $(this).each(function(index){ 
    var myvalue = $(this).attr("value"); 
    $(this).focusin(function(){
      if($(this).val() == myvalue)
      $(this).val("");
    });  
    $(this).focusout(function(){
      if($(this).val() === "")
      $(this).val(myvalue);
    });
  });    
};
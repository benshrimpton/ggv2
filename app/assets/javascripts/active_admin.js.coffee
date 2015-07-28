#= require tinymce

$ ->

  loadEditors()
  $(document).on 'has_many_add:before', (e, fieldset) ->
    $('textarea').removeClass 'mceEditor'
  $(document).on 'has_many_add:after', (e, fieldset) ->
    loadEditors()

loadEditors = ->
  tinyMCE.init
    mode: 'specific_textareas'
    editor_selector: 'mceEditor'
    theme: 'modern'
    plugins: [
      'advlist autolink lists link image charmap print preview hr anchor pagebreak'
      'searchreplace wordcount visualblocks visualchars code fullscreen'
      'insertdatetime media nonbreaking save table contextmenu directionality'
      'emoticons template paste textcolor'
    ]
    toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image preview | fontselect fontsizeselect forecolor backcolor '
    content_css: '/assets/application.css'

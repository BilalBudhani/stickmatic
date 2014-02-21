$ ->
  $('#images-list').on 'click', '.user-image', ->
    img = $(this).find('img');
    appendToList = $('#sidebar .panel-body .pack-preview li.empty').first()
    $(img.clone()).appendTo(appendToList);
    appendToList.removeClass('empty').addClass('filled');
  

    form_field = $("#js_instagram-preview-field .js_pack_field" ).clone();
    console.log(form_field)
    form_field.find('.js_instagramid').val(img.data('instagramid'))
    form_field.find('.js_instagram_thumbnail_url').val(img.data('thumburl'))
    $(form_field).appendTo(appendToList);

    if $('#sidebar .panel-body .pack-preview li.empty').length == 0
      $('form.packs input[name="commit"]').removeClass('hidden')
    return false;
  


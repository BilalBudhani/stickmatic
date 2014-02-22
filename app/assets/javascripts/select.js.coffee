$ ->
  $('#images-list').on 'click', '.user-image', ->
    img = $(this).find('img');
    emptyListItem = $('#sidebar .panel-body .pack-preview li.empty').first()
    emptyListItem.html(img.clone());
    emptyListItem.removeClass('empty').addClass('filled');


    form_field = $("#js_instagram-preview-field .js_pack_field" ).clone();
    form_field.find('.js_instagramid').val(img.data('instagramid'))
    form_field.find('.js_instagram_thumbnail_url').val(img.data('thumburl'))
    $(form_field).appendTo(emptyListItem);

    return false;



$ ->
  $('#images-list').on 'click', '.user-image', ->
    img = $(this).find('img');
    appendToList = $('#sidebar .panel-body .pack-preview li.empty').first()
    $(img.clone()).appendTo(appendToList);
    appendToList.removeClass('empty').addClass('filled');
    return false;
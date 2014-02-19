$ ->
  $('#images-list').on 'click', '.user-image', ->
    img = $(this).find('img');
    appendToList = $('#sidebar .panel-body .pack-preview li.empty').first()
    $(img.clone()).appendTo(appendToList);
    appendToList.removeClass('empty').addClass('filled');
    if $('#sidebar .panel-body .pack-preview li.empty').length == 0
      $('form.packs input[name="commit"]').removeClass('hidden')

    return false;
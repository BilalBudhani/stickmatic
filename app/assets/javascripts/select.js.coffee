$ ->
  $('#images-list').on 'click', '.user-image', ->
    img = $(this).find('img');
    $(img.clone()).appendTo('#sidebar .panel-body');
    return false;
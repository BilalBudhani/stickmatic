$ ->
  $('#images-list').on 'click', 'li img', ->
    img = $(this)
    emptyListItem = $('#sidebar li.empty').first()
    emptyListItem.html(img.clone())
    emptyListItem.removeClass('empty')

    template_form = $(".pack-item-template:first")
    clone_form = template_form.clone()
    clone_form.find('input[name="pack[pack_items_attributes][][uid]"]').attr('value', img.data('uid'))
    clone_form.find('input[name="pack[pack_items_attributes][][thumb]"]').attr('value', img.data('thumb'))
    clone_form.find('input[name="pack[pack_items_attributes][][image]"]').attr('value', img.data('image'))
    clone_form.appendTo(emptyListItem);

    return false;



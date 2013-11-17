$(document).ready(function(){
////////////////////////////////////////////////

  var newMenuHTML = function(id, name){
    return '<form action="/menus/delete/' + id + '" method="post"><input type="hidden" name="_method" value="delete"><input type="submit" class="button-d" value="X"><a href="/menus/update/' + id + '" class="menu-link">' + name + '</a></form>'
  }

  $('#add_menu_button').on('click', function(e){
    console.log('wtf')
    e.preventDefault()
    var menuName = $('#menuname').val()
    $.ajax({
      type: "post",
      url: "/",
      data: {name: menuName},
      success: function(data) {
        console.log(data.name)
        $('#menu_list').append(newMenuHTML(data.id, data.name))
        $('#menuname').val('')
      }
    })
  })

  var newItemHTML = function(item_id, item_name, item_price){
    return '<form action="/menuitem/delete/' + item_id + '" method="post"><input type="hidden" name="_method" value="delete"><input type="submit" class="button-d" value="X">' + item_name + ' - ' + item_price + '</form>'
  }

  $('#add_item_button').on('click', function(e){
    console.log('wtfitem')
    e.preventDefault()
    var formData = $('#item-form-id').serialize()
    console.log(formData)
    var route = $(this).attr('action')
    $.ajax({
      type: "delete",
      url: route,
      data: formData,
      success: function(data) {
        console.log(data.name, data.price)
        $('#items_list').append(newItemHTML(data.id, data.name, data.price))
        $('#menuitem').val('')
        $('#itemprice').val('')
      }
    })
  })

  $('#menu_list').on('click', '.button-d', function(e){
    console.log($(this).parent())
    e.preventDefault()
    $(this).parent().remove()
    var route = $(this).parent().attr('action')
    $.ajax({
      type: "delete",
      url: route,
      success: function(data) {
        console.log("data:", data)
      }
    })
  })


////////////////////////////////////////////////
})
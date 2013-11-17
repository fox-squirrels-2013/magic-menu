$(document).ready(function(){
////////////////////////////////////////////////

  var newMenuHTML = function(id, name){
    return '<p id="menu-to-delete"><form action="/menus/delete/' + name + '" method="post"><input type="submit" class="button-d" value="X"><a href="/menus/update/' + id + '" class="menu-link">' + name + '</a></form></p>'
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

  var newItemHTML = function(item_name, item_price){
    return '<p>' + item_name + ' - ' + item_price + '</p>'
  }

  $('#add_item_button').on('click', function(e){
    console.log('wtfitem')
    e.preventDefault()
    var formData = $('#item-form-id').serialize()
    console.log(formData)
    var route = $(this).attr('action')
    $.ajax({
      type: "post",
      url: route,
      data: formData,
      success: function(data) {
        console.log(data.name, data.price)
        $('#items_list').append(newItemHTML(data.name, data.price))
        $('#menuitem').val('')
        $('#itemprice').val('')
      }
    })
  })

  var menuList = $.trim($('#menu_list').html());

  function deleteStuff(){

    $('.menu_list').on('click', '.button-d', function(e){
      console.log('wtfff')
      e.preventDefault()
      $(this).closest('.menu-to-delete').remove()
    })

  }

  deleteStuff();
////////////////////////////////////////////////
})
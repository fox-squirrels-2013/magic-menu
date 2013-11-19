$(document).ready(function(){
////////////////////////////////////////////////


// ADD MENU ////////////////////////////////////

  var newMenuHTML = function(id, name){
    return '<form action="/menus/delete/' + id + '" method="post"><input type="hidden" name="_method" value="delete"><input type="submit" class="button-d" value="X"><a href="/menus/update/' + id + '" class="menu-link">' + name + '</a></form>'
  }

  // $('#add_menu_button').on('click', function(e){
  //     console.log('wtf')
  //   e.preventDefault()
  //   var menuName = $('#menuname').val()
  //   $.ajax({
  //     type: "post",
  //     url: "/",
  //     data: {name: menuName},
  //     success: function(data) {
  //         console.log(data.name)
  //       $('#menu_list').append(newMenuHTML(data.id, data.name))
  //       $('#menuname').val('')
  //     }
  //   })
  // })


// ADD ITEMS ////////////////////////////////////

  var newItemHTML = function(menu_id, item_id, item_name, item_price){
    return '<form class="new-item" action="/menuitem/delete/' + item_id + '" method="post"><input type="hidden" name="menu[id]" value="' + menu_id + '"><input type="hidden" name="_method" value="delete"><input type="submit" class="button-d" value="X">' + item_name + ' - ' + item_price + '</form>'
  }

  $('#add_item_button').on('click', function(e){
      console.log('wtfitem')
    e.preventDefault()
    var formData = $('#item-form-id').serialize()
      console.log(formData)
    var route = $('#item-form-id').attr('action')
      console.log("add route",route)
    $.ajax({
      type: "post",
      url: route,
      data: formData,
      success: function(data) {
          console.log(data.id, data.name, data.price)
        $('#items_list').append(newItemHTML(data.menu_id, data.id, data.name, data.price))
        $('#menuitem').val('')
        $('#itemprice').val('')
      }
    })
  })


// DELETE MENUS //////////////////////////////////

  $('#menu_list').on('click', '.button-d', function(e){
      console.log($(this).parent())
    e.preventDefault()
    var route = $(this).parent().attr('action')
      console.log("route: ", route)
    $(this).parent().remove()
    $.ajax({
      type: "delete",
      url: route,
      success: function(data) {
        console.log("data:", data)
      }
    })
  })


// DELETE ITEMS //////////////////////////////////

  $('#items_list').on('click', '.button-d', function(e){
      console.log("this parent:",$(this).parent())
    e.preventDefault()
    var newItemFormData = $('.new-item').serialize()
    var route = $(this).parent().attr('action')
    $(this).parent().remove()
      console.log("new item form data:",newItemFormData)
    newDRoute = '/menuitem/delete/' + newItemFormData.id + ''
    $.ajax({
      type: "delete",
      url: route,
      data: newItemFormData,
      success: function(data) {
        console.log("ITEM data:", data)
      }
    })
  })


////////////////////////////////////////////////
})
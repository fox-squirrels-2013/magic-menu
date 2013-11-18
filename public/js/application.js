$(document).ready(function() {

  $('button#add_menu').on('click', function(e){
    e.preventDefault()
    console.log("something his happening at least")

    $.post("/menus/create", {
      menu_name: $('[name="menu_name"]').val(),
      dataType: 'json',
      some_type: 'jason'
    },
    function(data,status){
      console.log(data)
      if(typeof data =='object'){
       console.log(data.menu.name)
        $('#error_messages').html(data)
       $('#menus_list ul').append("<li><a href='/menus/" + data.menu.id + "'>" + data.menu.name + "</a></li>")
     } else {
      $('#error_messages').html(data)
     }
   });
  })

$(document).on('click', '#menu_items_list a', function(e){
  e.preventDefault()
  var currentItem = $(this).parentsUntil('ul')
  $.post("/menus/items/delete",
    {
      _method: "delete",
      item_id: $(this).attr('itemid'),
      menu_id: $(this).attr('menuid')
    },
    function(data,status){
      currentItem.remove();
    })
})

$('#menu_items_dropdown select').on('change', function(e){
  e.preventDefault()
  var itemValue = this.value
  var itemText = $(this).text()
  var menuId = $('#menu_id').val()
  console.log(menuId)
  $.post("/menus/items/create",
  {
    item_id: itemValue,
    menu_id: menuId,
    dataType: 'json'
  },
  function(data,status){
    $('#menu_items_list ul').append("<li><a href='#' itemid='" + data.item_id + "' menuid='" + data.menu_id + "'>x</a> " + data.name + " - $" + data.price)
  })
})


$('#add_item').on('click', function(e){
  e.preventDefault()

  $.post("/items/create",
  {
   item_name: $('[name="item_name"]').val(),
   item_price: $('[name="item_price"]').val(),
   dataType: 'json'
  },
  function(data,status){
    if(typeof data =='object'){
       console.log(data.item.name)
        $('#error_messages').html(data)
    $('#items_list ul').append("<li>" + data.item.name + " - $" + data.item.price + "</li>")
     } else {
      $('#error_messages').html(data)
     }
  })
})


});

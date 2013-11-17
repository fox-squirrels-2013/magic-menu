$(document).ready(function() {

  $('#items').on('submit', function(e) {
    e.preventDefault()
    var itemDetails = $(this).serialize()
    // {item: {'name': itemName, 'price': itemPrice}}
    $.ajax({
      type: 'post',
      url: '/items',
      data: itemDetails
    }).done (function(returnData) {
      if (returnData.name === undefined) {
        return false
      } else {
        $('#all_items').append('<li>'+returnData.name+' '+returnData.price+'</li>')
      }
    })
  })

   $('#menus').on('submit', function(e) {
    e.preventDefault()
    var menuDetails = $(this).serialize()
    $.ajax({
      type: 'post',
      url: '/menus',
      data: menuDetails
    }).done (function(returnData) {
      if (returnData.name === undefined) {
        return false
      } else {
        $('#all_menus').append('<a href="/menus/'+returnData.id+'"><li>'+returnData.name+'</li></a>')
      }
    })
  })

});

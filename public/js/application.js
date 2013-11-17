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

});

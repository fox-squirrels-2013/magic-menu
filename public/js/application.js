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


  $('#select_item').on('change', function(e) {
    var item = $('#select_item').val()
    firstNum = item.match(/\d/).index - 1
    itemName = item.substring(0, firstNum)
    menuId = $('h1').data('id')
    $.ajax({
      type: 'post',
      url: '/menus/'+menuId,
      data: {name: itemName}
    }).done (function(menuItem) {
      $liNode = $('<li>').append(menuItem.name + ' ' + menuItem.price)
      $liNode.append($('<input>').addClass('item').attr('data-id', menuItem.id).attr('type', 'submit').attr('value', 'Delete'))
      $('#menu_items').append($liNode)
      // $('#menu_items').append('<li>' + menuItem.name + ' ' + menuItem.price + '</li>')
    }).fail(function() {
      console.log('failllllled!')
    })
  })

  $('#menu_items').on('click', '.item', function(e) {
    $this = $(this)
    itemId = $this.data('id')
    menuId = $("h1").data("id")
    $.ajax({
      type: 'post',
      url: '/menus/'+menuId+'/items',
      data: {item_id: itemId}
    }).done(function(returnData) {
      $this.closest('li').remove()
    })
  })
});

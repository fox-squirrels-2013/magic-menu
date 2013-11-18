$(document).ready(function() {
  $('form#add_menu input:nth-child(2)').on('click', function() {
    if ($(this).prev().val() === '') {
      $(this).after("<span class='error'>Name can't be blank</span>")
    }
  })
  $('form#add_item input:nth-child(3)').on('click', function() {
    var price = $(this).prev()
    var name = price.prev()

    if (price.val() === '' || name.val() === '') {
      $(this).after("<span class='error'>Name and price can't be blank</span>")
    }
  })
  
  $('form#add_menu').on('submit', function(event) {
    event.preventDefault()

    var form_data = $(this).serialize()

    $.ajax({
      url: '/menus/create/new',
      type: 'POST',
      data: form_data
    }).done(function(server_data) {
      if (server_data === '{"name":["Name can\'t be blank"]}') {
        var parsed_data = $.parseJSON(server_data)
        $('span.error').html(parsed_data["name"])
      } else {
        $('div#menus').html('').html(server_data)
      }
    }).fail(function() {
      console.log('failed')
    })
  })

  $('form#add_item').on('submit', function(event) {
    event.preventDefault()

    var form_data = $(this).serialize()

    $.ajax({
      url: '/item/create/new',
      type: 'POST',
      data: form_data
    }).done(function(server_data) {
      console.log(server_data)
      if (server_data === '{"name":["Item names need to exist"],"price":["Items need prices"]}' || server_data === '{"name":["Item names need to exist"]}' || server_data === '{"price":["Items need prices"]}') {
        var parsed_data = $.parseJSON(server_data)

        if (parsed_data["name"]) {
          $('span.error').append(parsed_data["name"])
        }
        if (parsed_data["price"]) {
          $('span.error').append(parsed_data["price"])
        }
      } else {
        $('div#items').html('').html(server_data)
      }
    }).fail(function() {
      console.log('failed')
    })
  })

  $('select#update_menu_item_list').on('change', function() {
    var menu_id = $(this).attr('data-id')
    var data = $(this).serialize()

    $.ajax({
      url: '/menus/' + menu_id + '/update',
      type: 'PUT',
      data: data
    }).done(function(server_data) {
      $('div#items_in_menu').html('').html(server_data)
    }).fail(function() {
      console.log('failed')
    })
  })

  $('a.delete').on('click', function(event) {
    event.preventDefault()

    var menu_id = $(this).attr('data-delete')

    $.ajax({
      url: '/item/' + menu_id + '/delete',
      type: 'DELETE',
      success: {submit: true}
    }).done(function(server_data) {
      $('div#items_in_menu').html('').html(server_data)
    }).fail(function() {
      console.log('failed')
    })
  })
});

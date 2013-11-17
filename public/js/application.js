$(document).ready(function() {
  var menuLink = function(id, title){
    // console.log(id + " and " + title)
    return "<li><a href='/menu/" + id + "'>" + title + '</a></li>'
  }

  $('body').on('submit', '#menu_add', function(e){
    e.preventDefault()
    // console.log("I'm Rick James, ")
    var formData = $('form').serialize()
    // console.log(formData)
    $.ajax({
      type: 'post',
      url: '/menu',
      data: formData
    }).done(function(response){
      var deliciousTreat = menuLink(response.id, response.title)
      // console.log(deliciousTreat)
      $('.menu_list').append(deliciousTreat)
    })
  })

  $('body').on('click', '#add-item-link', function(e){
    e.preventDefault()
    $.ajax({
      type: 'get',
      url: '/item'
    }).done(function(response){
      $('.container').replaceWith(response)
    })
  })

  $('body').on('click', '#add-menu-link', function(e){
    e.preventDefault()
    $.ajax({
      type: 'get',
      url: '/menu'
    }).done(function(response){
      $('.container').replaceWith(response)
    })
  })

  $('body').on('submit', '#item_add', function(e){
    e.preventDefault()
    // console.log("I'm Rick James, ")
    var formData = $('form').serialize()
    console.log(formData)
    $.ajax({
      type: 'post',
      url: '/item',
      data: formData
    }).done(function(response){
      console.log(response)
      var niceDelight = "<li>" + response.title + ": $" + response.cost + "</li>"
      $('.item_list').append(niceDelight)
    })
  })

  $('body').on('submit', '#add-relationship', function(e){
    e.preventDefault()
    var formData = $('form').serialize()
    var menuId = $('#menu_id').val()
    console.log(formData)
    console.log(menuId)
    $.ajax({
      type: 'put',
      url: '/menu/' + menuId,
      data: formData
    }).done(function(response){
      console.log(response)
      var specialSurprise = '<li><a href="/item/' + response.item.id + '/delete" data-menu-id="' + menuId + '">x</a> ' + response.item.title +' - $' + response.item.cost
      $('#items_from_menu').append(specialSurprise)
    })
  })

  // Need to build an event listener to stop get '/item/:item_id/delete' do
  // And wrap a piece of data into it about the relationship that needs to be nuked
});


// <a href="/item/<%= item.id %>/delete" data-delete="<%= item.id %>" class="delete">x</a>
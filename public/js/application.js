$(document).ready(function() {
  var duplicationMessage = "<div id='mate'><p>Maaaaate, you can't have the same item on a menu twice</p></div>"

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
      var specialSurprise = '<li><a href="/item/relationship" class="relationship-killer" data-menu-id="' + menuId + '" data-item-id="' + response.item.id + '">x</a> ' + response.item.title + ' - $' + response.item.cost
      $('#items_from_menu').append(specialSurprise)
    }).fail(function(response){
      console.log(duplicationMessage)
      $('#add-relationship').append(duplicationMessage)
    })
  })

  $('body').on('click', '.relationship-killer', function(e){
    e.preventDefault()
    var relationshipData = {'menu_id': $(this).attr('data-menu-id')};
    relationshipData.item_id = $(this).attr('data-item-id')
    console.log(relationshipData)
    // var forRealz = $(relationshipData).serialize()
    // console.log(forRealz)
    $.ajax({
      type: 'get',
      url: '/item/relationship',
      data: relationshipData
    }).done(function(response){
      console.log(response)
      $('.relationship-killer[data-item-id="' + response.item_id + '"]').parent().remove();
    })
  })

  $('body').on('submit', function(){
    $('#mate').remove()
  })


});
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
      // var deliciousTreat = menuLink(response.id, response.title)
      console.log(response)
      var niceDelight = "<li>" + response.title + ": $" + response.cost + "</li>"
      $('.item_list').append(niceDelight)
    })
  })
});

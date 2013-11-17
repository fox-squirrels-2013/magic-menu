$(document).ready(function() {
  var menuLink = function(id, title){
    console.log(id + " and " + title)
    return "<li><a href='/menu/" + id + "'>" + title + '</a></li>'
  }

  $('body').on('submit', '#menu_add', function(e){
    e.preventDefault()
    console.log("I'm Rick James, ")
    var formData = $('form').serialize()
    console.log(formData)
    $.ajax({
      type: 'post',
      url: '/menu',
      data: formData
    }).done(function(response){
      console.log(response)
      var deliciousTreat = menuLink(response.id, response.title)
      console.log(deliciousTreat)
      $('.menu_list').append(deliciousTreat)
    })
  })

});

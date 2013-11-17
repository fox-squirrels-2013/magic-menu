$(document).ready(function(){
////////////////////////////////////////////////

  var newMenuHTML = function(id, name){
    return '<p><a href="/menus/update/' + id + '"> ' + name + '</a></p>'
  }

  $('#add_menu_button').on('click', function(e){
    console.log('wtf')
    e.preventDefault()
    var menuName = $('#menuname').val()
    $.ajax({
      type: "post",
      url: "/",
      data: {name: menuName},
      success: function(data) {
        console.log(data.name)
        $('#menu_list').append(newMenuHTML(data.id, data.name))
        $('#menuname').val('')
      }





    })




  })














////////////////////////////////////////////////
})
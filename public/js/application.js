$(document).ready(function() {

  $("#item-dropdown-button").on('click',function(e){
    e.preventDefault
    $("#item-dropdown").toggleClass("dropdown-closed")
  })

  $("#item-select").change(function(){
    var item_id = $('select option:selected').val())
    $.ajax({
      type: 'post',
      url: '/menuitem/add'
      data: {item_id}
    })

  })
});

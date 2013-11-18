$(document).ready(function() {
  $('select').change(function (){ 
    item_id = $(this).find(':selected').val();
    menu_id = $('#menu-id').data('menu');
    $.ajax({
      url: "/menu/" + menu_id,
      type: "post",
      data: {item_id: item_id}
    }).done(function(server_data){
       $('.menu_items').append("<div class = 'item-container'> <span class='delete-button'><a href='#' data-id='" + server_data.id+ "' >[x]</a></span><span class = 'item' data-id ='" + server_data.id + "'>" + server_data.name + '-' + server_data.price + '</span></div>')
    });
  });


$('.menu_items').on("click", '.delete-button a', function(event) {
  $this = $(this); 
  item_id = $this.attr("data-id");
  menu_id = $('#menu-id').data('menu');
  $.ajax({
    url: "/menu/" + menu_id,
    type: "delete", 
    data: {item_id: item_id}
  }).done(function(server_data){ 
    $this.closest('.item-container').remove();
  }); 
});

$('#button').on("click", function(e){
  e.preventDefault();
  menu_description = $('#textbox').val()
  $.ajax({
    url: "/menu",
    type: "post", 
    data: {menu_description: menu_description}
  }).done(function(server_data){ 
     $('.list-container').append("<a href=menu/" + server_data.id + ">" + server_data.description  + "</a>")
 
  });
});

$('#button').on("click", function(e) { 
  console.log("test working")
  e.preventDefault(); 
  item_description = $('form').serialize()
  $.ajax({
    url: "/item",
    type: "post", 
    data: item_description 
  }).done(function(server_data){ 
    console.log(server_data)
    $('#list-container').append("<p>" + server_data.price   + server_data.description+ "</p>")
  })
})

});

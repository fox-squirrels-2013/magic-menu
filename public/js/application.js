$(document).ready(function() {
  $('select').change(function () { 
    item_id = $(this).find(':selected').val();
    menu_id = $('#menu-id').data('menu');
    $.ajax({
            url: "/menus/" + menu_id,
            type: "post",
            data: {item_id: item_id}
    }).done(function(server_data){
            $('.Listitems').append("<span class='delete-button'><a href='#'>[x]</a></span>" + server_data.name + '-' + server_data.price)
    });
  });

 });

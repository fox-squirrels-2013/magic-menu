$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#Menu-Items').change(function(e){
    e.preventDefault();
    //We want the food id and the menu id so we can get it into the database
    var food_id = e.target.value
    var menu_id = $('#menu-id').data('menu')
    // here we define our ajax request
    $.ajax({
      //what route do we send it to. data- what are we sending it
      type: "POST",
      url: "/menus/" + menu_id,
      data: {food_id: food_id}
      // when it comes back, it returns server_data/banana/whatever
    }).done(function (server_data){
      // some action after returning from server
      // {item_info: @item}.to_json
      // This following line; we had to pass HTML into the append surrounded by " ".  We had to add concatentation ( + ) between it and the server data
      $('.new-item').append("<span class='btn-delete'><a href='#'>[x]</a>" + server_data.item_name + "</span>");
      // console.log(server_data.item_name);
    });

  });
});

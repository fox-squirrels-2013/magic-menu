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
      $('.new-item').append("<div class='trial' ><span class='btn-delete'><a href='#'>[x]</a>" + server_data.item_name + "</span></div>");
      // console.log(server_data.item_name);
    });
  });

  $('.menu-item').on('click', function(e) {
    e.preventDefault();
    //This grabs my <span> tag that includes everything I need to delete
    var wicked = $(this)
    //Separating the item retruned from the event listener into the Item_id i need
    var item_id = e.target.id.split("_")[1]
    //Borrowed this to get the menu id from example above
    // could not implement 'data' again for item_id though
    var menu_id = $('#menu-id').data('menu')
    //Ajax call goes through great, my work around to remove the
    //item from the list was to use the var wicked defined earlier
    //to access the span
    $.ajax({
      type: "DELETE",
      url: "/menus/" + menu_id,
      data: {item_id: item_id}
    }).done(function(server_data){
      wicked.find('span').remove()
    })
    // ($(this).find('span').remove())
    });

  $('.new-item').on('submit', function(e){
    e.preventDefault();

    console.log('here')})
});

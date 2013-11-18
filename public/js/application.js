$(document).ready(function() {

  $('#add_menu').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: "/menus/new",
      type: "post",
      data: $(this).serialize()
    }).done(function(response){
      console.log("Inside ajax done.");
      console.log(response);
      $('.menu_list').append('<div id="menu_'+response.menu_id+'"><li><a href="/menus/'+response.menu_id+'">'+response.menu_name+'</a></li></div>');
    });
  });

  $('#add_item_and_price_to_menu').submit(function(e){
    e.preventDefault();
    console.log("clicked add item to menu button.");
    $.ajax({
      url: $(this).attr('action'),
      type: "post",
      data: $(this).serialize()
    }).done(function(response){
      console.log(response);
      $('#items_on_menu').append("<li class='item_name'>"+response.item_name+" for $ <button data-item-id='" + response.item_id + "'data-menu-id="+ response.menu_id +" class='delete_buttons'>Delete!</button></li>");
    });
  });

// delegation!
  $('body').on('click',".delete_buttons",function(e){
    e.preventDefault();
    var menuItemData = {"menu_id": $(this).data("menu-id"), "item_id":$(this).data("item-id")};
    var button = this;
    console.log("after prevent default.");
    $.ajax({
      url: '/items_menus',
      type: 'delete',
      data: menuItemData
    }).done(function(response){
      console.log("Deleted!!!!!");
      $(button).closest(".item_name").remove();
    });
  });

});







  // $('#add_todo').submit(function(e){
  //   e.preventDefault();
  //   console.log("After preventDefault!")
  //   $.ajax({
  //     url: "/todos", //this.action,
  //     type: "post", //this.method,
  //     data: $(this).serialize()
  //   }).done(function(response){
  //     console.log(response)
  //     $('.available-todos').append('<div id="todo-' + response.todo_id + '"><h2>' + response.todo_task + '</h2><form class="complete" method="POST" action="/todos/' + response.todo_id + '/complete"><button>Complete!</button></form></div>');
  //     console.log("Inside done function.");
  //     $("#new_todo_task").val('')
  //   })
  //   // return false
  // })



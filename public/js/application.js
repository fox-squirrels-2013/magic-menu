$( document ).ready(function() {

   // menu 


   $('#form_menu').on("submit", function(event){
    event.preventDefault();
    $.ajax({
      type: this.method,              
      url: this.action,
      data:$(this).serialize()              
    }).done(function(itemData) {
      
      itemJson  = JSON.parse(itemData);
   
      list = "<li data-id=" + itemJson.menu.id + "><a href='/menus/"+ itemJson.menu.id +"'>" + itemJson.menu.name +"</a><br /><a href='#' class='delete-menu'>Delete</a></li>"
      
      $('#menu_items_list').append(list)

       $('.messages').html("<h1> You created the followin menu:" + itemJson.menu.name + " </h1>").show().delay(4000).fadeOut()
      
    }).fail(function(){
      console.log('fail');
    });
  });

   // delete

   $('.delete-menu').on('click', function(e){

    e.preventDefault();
    itemId =  $(this).closest('li').data("id")
   // delete dom
    $(this).closest('li').remove()
    // delete from server
    $.ajax({
      type: 'DELETE',
      url: "/menu",
      data: {"id": itemId} 
    }).done(function(data) {
      
      $('.messages').html("<h1>" + data + " </h1>").show().delay(4000).fadeOut()
    })    
    }) 

    // item

    

});
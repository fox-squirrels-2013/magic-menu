$( document ).ready(function() {

   // delete item



   $('body').on('click', '.delete-item', function(e){

    e.preventDefault();

    itemsId =  $(this).closest('tr').data("id")
   // delete dom

   $(this).closest('tr').remove()
    // delete from server
    $.ajax({
      type: 'DELETE',
      url: "/item",
      data: {"id": itemsId} 
    }).done(function(data) {

      $('.messages').html("<h1>" + data + " </h1>").show().delay(4000).fadeOut()
    })    
  }) 


   // menu 


   $('#form_menu').on("submit", function(event){
    event.preventDefault();
        $.ajax({
          type: this.method,              
          url: this.action,
          data:$(this).serialize()              
        }).done(function(data) {
          $('#menu_input').val('');          
// "{"menu":{"menu":{"id":null,"name":""}},"error_messages":["Name can't be blank"],"messages":null}"            
          dataJson  = JSON.parse(data);

          if (dataJson.error_messages) {

            $('.messages').html("<h1 class='error'> You did not create a menu:" + dataJson.error_messages + " </h1>").show()
          }

          else {
          list = "<li data-id=" + dataJson.menu.menu.id + "><a href='/menus/"+ dataJson.menu.menu.id +"'>" + dataJson.menu.menu.name +"</a><br /><a href='#' class='delete-menu'>Delete</a></li>"
          
          $('#menu_items_list').append(list)

          $('.messages').html("<h1> You created the followin menu:" + dataJson.menu.menu.name + " </h1>").show().delay(4000).fadeOut()

        }
          
          }).fail(function(){
          console.log('fail');
        });
    });


  // add item

    $('#form_items').on("submit", function(event){
        event.preventDefault();
        $.ajax({
          type: this.method,              
          url: this.action,
          data:$(this).serialize()              
        }).done(function(data) {



          dataJson  = JSON.parse(data);

          if (dataJson.error_messages) {

            $('.messages').html("<h1 class='error'> You did not create a item: " + dataJson.error_messages + " </h1>").show()
          }

          else {

          list = "<tr data-id=" + dataJson.item.item.id + "><td ><a href='#' class='delete-item'>[X]   </a></td><td>" + dataJson.item.item.name + "</td><td>" + dataJson.item.item.price + "</td>/tr>"
          
          $('#all_items_list').append(list)

          $('.messages').html("<h3> You created the followin item:" + dataJson.item.item.name + " </h3>").show().delay(4000).fadeOut()

        }
          
          }).fail(function(){
          console.log('fail');
        });
    }); 

   // delete menu

   $('body').on('click', '.delete-menu', function(e){

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

    

   // delete

   $( "body" ).on('change', "#selectionField",function() {
      console.log('selected something')
         
         menuId = $('#menu-name').data('id')
   $.ajax({
          type: 'POST',              
          url: '/menus/' + menuId + '/items',
          data: { itemID: $(this).val() }              
        }).done(function(itemsData) {
          itemsJson  = JSON.parse(itemsData);

          list = "<tr data-id=" + itemsJson.item.id + "><td ><a href='#' class='delete-item'>[X]   </a></td><td>" + itemsJson.item.name + "</td><td>" + itemsJson.item.price + "</td>/tr>"

          $('#all_items_list').append(list)
      });
    });

   // {"item":{"id":15,"name":"Red stuff","price":"7"}} 



});
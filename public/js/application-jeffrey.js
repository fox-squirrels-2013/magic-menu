// "Namespacing" -- collecting related JS functions into objects with good names describing that functionality

var ErrorHandlers = {

  // b is status or error
  // c is error or status
  log: function(xhr, b, c) {
    // debug to see what's in a, b, and c
    console.log('fail', xhr, b, c);
  }

};



var DOMManipulation = {
  addMenuToMenuList: function(dataJson) {
    $('#menu_input').val('');

    if (dataJson.error_messages) {

      $('.messages').html("<h1 class='error'> You did not create a menu:" + dataJson.error_messages + " </h1>").show()
    }

    else {
      list = "<li data-id=" + dataJson.menu.menu.id + "><a href='/menus/"+ dataJson.menu.menu.id +"'>" + dataJson.menu.menu.name +"</a><br /><a href='#' class='delete-menu'>Delete</a></li>"

      $('#menu_items_list').append(list)

      $('.messages').html("<h1> You created the followin menu:" + dataJson.menu.menu.name + " </h1>").show().delay(4000).fadeOut()

    }

  }

};

var FormSubmissionHandlers = {
  onNewMenuSubmit: function(event){
    event.preventDefault();
    $.ajax({
      type: this.method,
      url: this.action,
      data:$(this).serialize(),
      dataType: 'json'
    })
    .done(DOMManipulation.addMenuToMenuList)
    .fail(ErrorHandlers.log);
  },

  onNewItemSubmit: function(event){
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
  }
};

var DeletionHandlers = {
  onClickDeleteItem: function(event){

    event.preventDefault();

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
  },

  onClickDeleteMenu: function(event){
    event.preventDefault();
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
  }

};

var SelectionChangeHandlers = {
  onSelectMenuItem: function(event) {
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
  }
};





$(document).ready(function() {
  $('#form_menu').on("submit", FormSubmissionHandlers.onNewMenuSubmit);
  $('#form_items').on("submit", FormSubmissionHandlers.onNewItemSubmit);
  $('body').on('click', '.delete-item', DeletionHandlers.onClickDeleteItem);
  $('body').on('click', '.delete-menu', DeletionHandlers.onClickDeleteMenu);
  $('body').on('change', "#selectionField", SelectionChangeHandlers.onSelectMenuItem);
});

$(document).ready(function() {
  $('#item-select').change(function() {
    //we need a listener for item selection
    itemId = $("select option:selected").val()
    // grab menu item from data-attribute on select element
    menuId = $("#item-select").data().menuid

    // console.log("itemID: " + itemId);
    // console.log("menuID: " + menuId);
    //on the item selection send a ajax call post to /menu/:id/item

    $.ajax({
      url: "/menu/"+menuId+"/item",
      type: "post",
      data: {"item_id": itemId}
    }).success(function(data){
      $('.list').append(data.item_html)

//on completion of ajax call append item and button to the menus view
    })
  })

// this is event delegation used for deleting item and button on menus view
  $('.container').on('click', '.deletebtn', function(e){
    e.preventDefault()
    // debugger
    var itemId = $(this).data("item-id")
    var menuId = $(this).data("menu-id")
    var clickedItem = $(this).parent()
    $.ajax({
      url: "/menuitem",
      type: "DELETE",
      data: {"item_id": itemId, "menu_id":menuId}
    }).success(function(){
      $(clickedItem).remove()
    })
  })

  //use ajax to implement add item button on the items view
  $('#additembtn').on('click', function(e){
    e.preventDefault()
    var itemName = $('#itemname').val()
    var itemPrice = $('#itemprice').val()

    $.ajax({
      url: "/items",
      type: "POST",
      data: {"name": itemName, "price": itemPrice}
    }).success(function(data){
      $('#table').append(data.item_add)
      // $('#table').append()
    })
  })
  
  
});

$(document).ready(function() {
  $('#item-select').change(function() {

    itemId = $("select option:selected").val()
    // grab menu item from data-attribute on select element
    menuId = $("#item-select").data().menuid

    // console.log("itemID: " + itemId);
    // console.log("menuID: " + menuId);
    
    $.ajax({
      url: "/menu/"+menuId+"/item",
      type: "post",
      data: {"item_id": itemId}
    }).success(function(data){
      $('.list').append(data.item_html)

      //on completion of ajax call append item and delete button to the menu
    })
  })

  // this is delegation
  $('.container').on('click', '.deletebtn', function(e){
    e.preventDefault()
    var itemId = $(this).data("item-id")
    var menuId = $(this).data("menu-id")
    var clickedItem = $(this).parent()
    $.ajax({
      url: "/menuitem",
      type: "DELETE",
      data: {"item_id": itemId, "menu_id":menuId}
    }).success(function(){
      $(clickedItem).fadeOut()
    })
  })


  //we need a listener for item selection
  //on the item selection send a ajax call post to /menu/:id/item
  //on completion of ajax call append item to the menu 
});

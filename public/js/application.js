$(document).ready(function() {
  $('#item-select').change(function() {

    itemId = $("select option:selected").val()
    // grab menu item from data-attribute on select element
    menuId = $("#item-select").data().menuid
    
    $.ajax({
      url: "/menu/"+menuId+"/item",
      type: "post",
      data: {"item_id": itemId}
    }).success(function(itemData){
      console.log(itemData)
    })
  })

  //we need a listener for item selection
  //on the item selection send a ajax call post to /menu/:id/item
  //on completion of ajax call append item to the menu 
});

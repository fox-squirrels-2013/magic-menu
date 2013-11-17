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
    }).success(function(itemData){
      // $('.newitem').append("<h3>"+itemData.name+"</h3>")
      var addedItem = $('.newitem').append("<div class='item-wrapper'></div>")
      console.log(itemData)
      addedItem.append('<a class="deletebtn" href="/menu/'+menuId+'/item/'+itemId+'/delete">x</a>')
      addedItem.append('<h3>'+itemData.name+'</h3>')

    })
  })

  $('.deletebtn').on('click', function(e){

    e.preventDefault()
    console.log($(e.target).attr('href'))
    $.ajax({
      url: ($(e.target).attr('href')),
      type: "post"
    }).success(function(){
      $(e.target).parent().remove()
    })
  })


  //we need a listener for item selection
  //on the item selection send a ajax call post to /menu/:id/item
  //on completion of ajax call append item to the menu 
});

$(document).ready(function() {

  $("#item_selector").on("change", function(e){
    var selectedData = JSON.parse($("#item_selector").val())
    $.ajax({
      url: "/menus/" + selectedData["menu"],
      type: "POST",
      data: {'item_id': selectedData["item"], 'menu_id': selectedData["menu"]}
    }).done(function(server_data){
      $("#whole_menu").html(server_data)
    })
  })

  $(".delete_item").on("click", function(e){
    var buttonsData = e.target.id
    var splitData = buttonsData.split('_')
    var itemID = parseInt(splitData[0], 10)
    var menuID = parseInt(splitData[1], 10)
    $.ajax({
      url: "/menus/" + menuID,
      type: "DELETE",
      data: {'item_id': itemID, 'menu_id': menuID}
    }).done(function(server_data){
      $("#menu_items").html(server_data)
    })
  })

  $("#item_creator").on("submit", function(e){
    e.preventDefault()
    var formData = $("#item_creator").serialize()
    $("#item_creator_1").val("")
    $("#item_creator_2").val("")
    var splitData = formData.split("&")
    var itemName = splitData[0].slice(5)
    var itemName = itemName.split("+").join(" ")
    var itemPrice = splitData[1].slice(9)
    $.ajax({
      url: "/items",
      type: "POST",
      data: {'item_name': itemName, 'item_price': itemPrice}
    }).done(function(server_data){
      $("#items_table").html(server_data)
    })
  })

  $("#menu_creator").on("submit", function(e){
    e.preventDefault()
    var formData = $("#menu_creator").serialize()
    $("#menu_creator_1").val("")
    var menuName = formData.slice(5).split("+").join(" ")
    $.ajax({
      url: "/",
      type: "POST",
      data: {'menu_name': menuName}
    }).done(function(server_data){
      $("#menu_listing").html(server_data)
    })
  })
})

// after formName, add each input's name (value of id attribute) 
// as an argument
function validateForm(formName) {
  numInputFieldArgs = arguments.length - 1
  for (var i=1; i<=numInputFieldArgs; i++) {
    var userInput = document.forms[formName][arguments[i]].value;
    if (userInput == null || userInput == "") {
      alert("Input fields cannot be empty");
      return false;
    }
  }
}



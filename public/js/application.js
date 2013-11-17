$(document).ready(function() {

  $("#item_selector").on("change", function(e){
    var selectedData = JSON.parse($("#item_selector").val())
    $.ajax({
      url: "/menus/" + selectedData["menu"],
      type: "POST",
      data: {'item_id': selectedData["item"], 'menu_id': selectedData["menu"]}
    }).done(function(serverData){
      returnedData = JSON.parse(serverData)
      $("#menu_item_table").append("<tr id='" + returnedData.item_id + "item_" + returnedData.menu_id + "menu'><td><button class='delete_item_button'>x</button></td><td>" + returnedData.item_name + "</td><td>-</td><td>" + returnedData.item_price + "</td></tr>")
      deletedItemListener()
    })
  })

  var deletedItemListener = function(){ $("#menu_item_table tr").on("click", function(e){
      if (e.target.nodeName == 'BUTTON') {
        var clickedTR = this
        var buttonsData = clickedTR.id
        var splitData = buttonsData.split('_')
        var itemID = parseInt(splitData[0], 10)
        var menuID = parseInt(splitData[1], 10)
        $.ajax({
          url: "/menus/" + menuID,
          type: "DELETE",
          data: {'item_id': itemID, 'menu_id': menuID}
        }).done(function(){
          $(clickedTR).remove()
        })
      }
    })
  }

  deletedItemListener()

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
    }).done(function(serverData){
      console.log(serverData)
      if (serverData != "no_error") {
        $("#items_form_errors").html(serverData)
      } else {
        $("#items_view_list").append("<tr><td>" + itemName + "</td><td>" + "$" + itemPrice + "</td></tr>")
      }
    })
  })

  var createdMenuListener = function(){ $("#menu_creator").on("submit", function(e){
      e.preventDefault()
      var formData = $("#menu_creator").serialize()
      $("#menu_creator_1").val("")
      var menuName = formData.slice(5).split("+").join(" ")
      $.ajax({
        url: "/",
        type: "POST",
        data: {'menu_name': menuName}
      }).done(function(serverData){
        $("#whole_index").html(serverData)
        createdMenuListener() // same self-referential matter as previous listener -- will clean up if can
      })
    })
  }

  createdMenuListener()
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



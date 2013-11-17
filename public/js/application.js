$(document).ready(function() {

// AJAX call below for creating a menu
	$("#create_menu").on("click", function(e){
		e.preventDefault()
		var menu_name = {'name': $("#menu_name").val()}
		$.ajax({
			url: "/menu/create",
			type: "post",
			data: menu_name
		}).done(function(menuData){
			var menu_html = "<a href=\"/menu/"+menuData['id']+"\">  "+menuData['name']+" </a>"
			console.log(menu_html)
			$('#menu_list').append(menu_html)
		})
	});

// AJAX call below for creating a selection
	$("#item_select").on("change", function(event){
		event.preventDefault()
		var item_id = $("#item_select option:selected").data("item-id")
		var menu_id = $("h1").data("menu-id")
		var menu_item_id = {'item_id': item_id, 'menu_id': menu_id}
		$.ajax({
			url: "/menu/item/assign",
			type: "post",
			data: menu_item_id
		}).done(function(itemDetails){
			var item_name = itemDetails['item']
			var item_price = itemDetails['price']
			var item_details = "<li>"+item_name+" - $"+item_price+"</li>"
			$('#menu_items_display').append(item_details)
		})
	})

//AJAX call below for creating an item
	$("#create_item").on("click", function(event){
		event.preventDefault()
		var itemName = 

	})

});

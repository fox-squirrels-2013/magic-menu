$(document).ready(function() {

	$( "select" ).change(function() {
    item_id = $(this).find(':selected').val();
    menu_id = $('#menu-id').data('menu');
    itemData = {item_id: item_id};
    fetchMenus(itemData, menu_id).done(function(serverData){
    	$('.items').append("<div class='menu_item'><span class='delete-button'><a href='#'>[x]</a></span><span class=item_" + serverData.id +">" + serverData.name + '-' + serverData.price + "</span></div>")
    });
    // $.ajax({
    // 	url: "/menus/" + menu_id,
    // 	type: "post",
    // 	data: {item_id: item_id}
    // }).done(function(server_data){
    // 	$('.stickithere').append("<span class='delete-button'><a href='#'>[x]</a></span>" + server_data.name + '-' + server_data.price)
    // });
  });

	$("#submit-menu").submit(function(e){
		e.preventDefault()
		console.log("test1")
		menuName = $('#menu-name').val();	//selecting a value to uniquely identify item to send to server
		menuData = { menu: {name: menuName} }
		fetchMenus(menuData).done(function(serverData) {
			console.log(serverData)
			$('.stickmenushere').append("<div class='menu'><a href=/menus/" + serverData.item + ">" + serverData.name + "</a></div>")
		});
	});

	$("#submit-item").submit(function(e){
		e.preventDefault()
		console.log("test2")
		itemName = $('#item-name').val();
		itemPrice = $('#item-price').val();
		itemData = { item: {name: itemName, price: itemPrice}}
		fetchItems(itemData).done(function(serverData){
			console.log(serverData)
			$('.stickitemshere').append("<p>" + serverData.name + -  $+ serverData.price + "</p>")
		});
	});
//////////////////////////////////////////////////////////
	$('.delete-button a').on("click", function(e){

		e.preventDefault
		
		console.log("test3")
		itemId = $(this).attr("data-id");
			console.log(itemId)
		menuId = $('#menu-id').data('menu');
			console.log(menuId)
		itemData = { item: {id: itemId}, menu:{id: menuId}}
			console.log(itemData)
		
		$.ajax({
			url: "/menus/" + menuId,
			type: "delete",
			data: itemData,
		}).done(function(serverData){
			console.log(serverData)
			$(".item_" + itemId).closest('.menu_item').remove()
		});
	});
//////////////////////////////////////////////////////////////
});


	var fetchMenus = function(data, menuId){
		 menuId = typeof menuId !== 'undefined' ? "/" + menuId : ""
		 return $.ajax({
	    	url: "/menus" + menuId,
	    	type: "post",
	    	data: data,
	    })
	}

	var fetchItems = function(data){
		 return $.ajax({
	    	url: "/items",
	    	type: "post",
	    	data: data,
	    })
	}
//default action of pressing submit is to make a get request and refresh the page
	


//$('select option:selected')
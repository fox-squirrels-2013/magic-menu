$(document).ready(function() {

	$( "select" ).change(function() {
    item_id = $(this).find(':selected').val();
    menu_id = $('#menu-id').data('menu');
    itemData = {item_id: item_id};
    fetch(itemData, menu_id).done(function(serverData){
    	$('.stickithere').append("<span class='delete-button'><a href='#'>[x]</a></span>" + serverData.name + '-' + serverData.price)
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
		fetch(menuData).done(function(serverData) {
			console.log(serverData)
			$('.stickmenushere').append("<div class='menu'><a href=/menus/" + serverData.item + ">" + serverData.name + "</a></div>")
		});
	});



});


	var fetch = function(data, menuId){
		 menuId = typeof menuId !== 'undefined' ? "/" + menuId : ""
		 return $.ajax({
	    	url: "/menus" + menuId,
	    	type: "post",
	    	data: data,
	    })
	}


//default action of pressing submit is to make a get request and refresh the page
	


//$('select option:selected')
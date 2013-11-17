$(document).ready(function() {

	$('#create_menu').on('submit', function(e){
		e.preventDefault()
		var params = $(this).serialize()
		$.post('/menus', params, function(data) {
			var itemData = JSON.parse(data)
			appendToList(itemData.id, itemData.name)
		});
	})

	$('#create_item').on('submit', function(e){
		e.preventDefault()
		var params = $(this).serialize()
		$.post('/items', params, function(data) {
			var itemData = JSON.parse(data)
			appendToTable(itemData.id, itemData.name, itemData.price)
		});
	})

	$('#item_select').on('change', function(){
		var itemId = this.value
		$.post( targetUrl(itemId), function(data) {
			var itemData = JSON.parse(data)
			appendToTable(itemData.id, itemData.name, itemData.price)
		});
	})

	$('#item_table').on('click', function(e){
		var elementClass = $(e.target).closest('tr')[0].className
		var itemId = elementClass.split('-').pop()
		ajaxReq(targetUrl(itemId), 'DELETE')
		$('.' + elementClass).remove()
	})

});

function targetUrl(itemId){
	var loc = location.href.split('/').pop()
	if(loc === 'items'){ 
		return '/' + loc + '/' + itemId
	} else { 
		return currentMenuItem(itemId) 
	}
}

function currentMenuItem(itemId){
	var baseUrl = '/menuitems'
	var menuId = location.href.split('/').pop()
	return baseUrl + '/' + menuId + '/' + itemId
}

function ajaxReq(url, type, data){    
    $.ajax({ url: url, type: type, data: data // data can be undefined
    }).done(function(server_data){

    }).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}

function appendToList(id, name){
	var new_menu = '<li><a href="#">' + name + '</a></li>'
	$('#menu_list').append(new_menu)
}

function appendToTable(id, name, price) {
	var new_row = '<tr value="' + id + '"><td>' + name +  '</td><td>' + price + '</td></tr>'
	$('#item_table').append(new_row)	
}
$(document).ready(function() {

	$('form').on('submit', function(e){
		e.preventDefault()
		var params = $(this).serialize()
		$.post(currentLocation(), params, function(data) {
			var itemData = JSON.parse(data)
			if (itemData.id === undefined) {
				$('#alerts')[0].innerHTML = '<span>' + itemData + '</span>'
			} else {
				$('#alerts')[0].innerHTML = "'" + itemData.name + "' created"
				appendToSomething(itemData.id, itemData.name, itemData.price)
			}
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
	$('.' + elementClass).fadeOut()
})

});

function currentLocation(){
	return location.href.split('/').pop()
}

function appendToSomething(id, name, price){
	if(price === undefined){ appendToList(id, name, price)
	} else { appendToTable(id, name, price) }
}


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
    	console.log(server_data)
    }).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}

function appendToList(id, name){
	var new_menu = '<li><a href="#">' + name + '</a></li>'
	$('#menu_list').append(new_menu)
}

function appendToTable(id, name, price) {
	var new_row = '<tr class="table-item-' + id + '"><td>' + name +  '</td><td>' + price + '</td></tr>'
	$('#item_table').append(new_row)	
}
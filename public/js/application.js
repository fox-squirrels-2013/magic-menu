$(document).ready(function() {
	$('form').on('submit', function(e){
		e.preventDefault()
		var params = $(this).serialize()
		$.post(currentLocation(), params, function(data) {
			appendOrAlert( JSON.parse(data) )
		});
	})

	$('#item_select').on('change', function(){
		var id = this.value
		$.post( targetUrl(id), function(data) {
			appendOrAlert( JSON.parse(data) )
		});
	})

	$('#item_table').on('click', function(e){
		var id = $(e.target).closest('tr')[0].className.split('-').pop()
		ajaxReq(targetUrl(id), 'DELETE')
		$('.table-item-' + id).fadeOut()
	})
});

function currentLocation(){
	return location.href.split('/').pop()
}

function appendOrAlert(data) {
	if (data.id === undefined) {
		setAlert(data, 'Error: ', '<span>')
	} else {
		setAlert(data.name, 'added')
		appendToSomething(data.id, data.name, data.price)
	}	
}

function setAlert(item, message, extra){
	if(extra === undefined) { 
		$('#alerts')[0].innerHTML = "'" + item + "' " + message
	} else { 
		$('#alerts')[0].innerHTML = "<span>" + message + item + "</span>"
	}
}

function appendToSomething(id, name, price){
	if(price === undefined){ appendToList(id, name, price)
	} else { appendToTable(id, name, price) }
}


function appendToList(id, name){
	var new_menu = '<li><a href="#">' + name + '</a></li>'
	$('#menu_list').append(new_menu)
}

function appendToTable(id, name, price) {
	var new_row = '<tr class="table-item-' + id + '"><td>' + name +  '</td><td>' + price + '</td></tr>'
	$('#item_table').append(new_row)	
}

function targetUrl(itemId){
	var loc = currentLocation()
	if(loc === 'items'){ 
		return '/' + loc + '/' + itemId
	} else { 
		return '/menuitems/' + loc + '/' + itemId 
	}
}

function ajaxReq(url, type, data){    
	$.ajax({ url: url, type: type, data: data
	}).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}
